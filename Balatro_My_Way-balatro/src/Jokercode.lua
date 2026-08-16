SMODS.Atlas {
	key = "My_Way_and_The_Highway",
	path = "1234567890.png",
	px = 71,
	py = 95
}

SMODS.Attribute({ key = "food", keys = { 'j_xiferp_chocoins', 'j_xiferp_sandwich', 'j_xiferp_alphabet', 'j_xiferp_sweettea' }})

SMODS.Attribute({ key = "drink", keys = { 'j_diet_cola', 'j_selzer', 'j_xiferp_sweettea' }})

SMODS.current_mod.optional_features = function()
    return {
        retrigger_joker = true,
    }
end

-- Corrupted DNA
SMODS.Joker {
    key = "corrupted_dna",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 0, y = 0 },
    config = { extra = { copy }},
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.other_card == context.scoring_hand[1] and context.individual and not context.blueprint then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local copied_card = copy_card(context.scoring_hand[1], nil, nil, G.playing_card)
            SMODS.modify_rank(copied_card, pseudorandom_element({-1, 0, 1}, xiferp_card_rank_roll))
            copied_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, copied_card)
            G.hand:emplace(copied_card)
            copied_card.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    copied_card:start_materialize()
                    return true
                end
            }))
            return {
                message = localize('k_copied_ex'),
                colour = G.C.CHIPS,
                func = function() 
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { copied_card } })
                            return true
                        end
                    }))
                end
            }
        end
    end
}

-- Top to Bottom
SMODS.Joker {
    key = "top_to_bottom",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = {x = 1, y = 0}
}
local ref = SMODS.wrap_around_straight
function SMODS.wrap_around_straight() 
  if next(SMODS.find_card("j_xiferp_top_to_bottom")) then
    return true
  end

  return ref()
end


-- Out in Spades...
SMODS.Joker {
    key = "astro_card",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 2, y = 0 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra }}
    end,
    calculate = function(self, card, context)
        if context.end_of_round then
            local xiferp_card = pseudorandom_element(G.hand.cards, xiferp_astro_card)
            SMODS.change_base(xiferp_card, 'Spades')
        end
    end
}

-- Scorigami Board
SMODS.Joker {
    key = "scorigami",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 3, y = 0 },
    config = { extra = { chips = 0, chip_mod = 7 } },
    loc_vars = function(self, info_queue, card)
        local xiferp_unique_chip = (hand_chips)
	    return { vars = { card.ability.extra.chip_mod, localize(scorigami_table, xiferp_unique_chip), card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
         if context.round_eval and table.contains(scorigami_table, xiferp_unique_chip) then
             table.insert(scorigami_table, xiferp_unique_chip)
         end

	 if context.before and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

scorigami_table = scorigami_table or {}
function addToSet(scorigami_table, xiferp_unique_chip)
    set[xiferp_unique_chip] = true
end

function table.contains(scorigami_table, element)
  for all, xiferp_unique_chip in pairs(scorigami_table) do
    if xiferp_unique_chip == element then
      return true
    end
  end
  return false
end


-- Cell Phone
SMODS.Joker {
    key = "jphone",
    atlas = "phonedin_flipbook",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 0, y = 1 },
    config = { extra = { creates = 1, dollars = 6 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - card.ability.extra.dollars
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            rarity = 'Uncommon',
                            key_append = 'vremade_riff_raff',                 
                        }
                        G.GAME.joker_buffer = 0
                        G.GAME.dollar_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
                dollars = 0 - card.ability.extra.dollars,
            }
        end
    end
}




-- Szymii
SMODS.Joker {
    key = "szymii",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 1, y = 1 },
    config = {extra = {target_suit = nil}},
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local suits, suits2 = {}, {}
		    for k, v in ipairs(G.playing_cards) do
    			suits[v.base.suit] = (suits[v.base.suit] or 0) + 1
		    end
		    for k, v in pairs(suits) do
   		        table.insert(suits2, {suit = k, count = v})
		    end
		    table.sort(suits2, function(a,b) return a.count < b.count end)
		    card.ability.extra.target_suit = suits2[#suits2-1].suit
        end -- if there is exactly 1 suit with second-most frequency then we have a target
        if card.ability.extra.target_suit ~= nil and context.repetition and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.target_suit) then
            return {
                  repetitions = 1
             }
        end
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            card.ability.extra.target_suit = nil
        end
    end
}

-- Pop Can Joker
SMODS.Joker {
    key = "pop_can",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 2, y = 1 },
    config = { extra = { dollars = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[1] and context.other_card:is_suit("Diamonds") then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function() 
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
}

-- Particle Accelerator
 SMODS.Joker {
    key = 'lhc',
    atlas = "My_Way_and_The_Highway",
    rarity = 3,
    pos = { x = 3, y = 1 },
    cost = 10,
    blueprint_compat = false,
    calculate = function(self, card, context)
    if context.end_of_round then
        local element_cards_held = 0
        for i = 1, #G.consumeables.cards do
          if G.consumeables.cards[i].ability.set == 'xiferp_Element' then
         element_cards_held = element_cards_held + 1
       end
     end
    if element_cards_held == 2 then
        local el_sum = 0
        for _, xiferp_Element in ipairs(G.consumeables and G.consumeables.cards or {}) do
            if xiferp_Element ~= card then
              el_sum = el_sum + xiferp_Element.ability.extra.element_no
              SMODS.destroy_cards(xiferp_Element)
            end
        end     
        if el_sum <= 106 then
                for _, xiferp_Element in ipairs (G.P_CENTER_POOLS.xiferp_Element) do
                    if xiferp_Element.config.extra.element_no == el_sum then
                       SMODS.add_card { key = xiferp_Element.key }
                  end
                end
        end
     end
end
end
}

-- Bologna Sandwich
SMODS.Joker {
    key = "sandwich",
    atlas = "My_Way_and_The_Highway",
    rarity = 1,
    pos = { x = 0, y = 2 },
    cost = 2,
    blueprint_compat = false,
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
             for i = 1, #G.jokers.cards do
                 if G.jokers.cards[i].config.center.key == 'j_xiferp_lhc' then 
                     SMODS.add_card { key = 'c_xiferp_bolognium' }
                 end
             end
        end
        if context.individual and context.cardarea == G.play and context.other_card == context.full_hand[#context.full_hand] and #context.full_hand >= 3 and context.full_hand[1]:get_id() == context.full_hand[#context.full_hand]:get_id() then
            return {
                mult = card.ability.extra.mult
            }
    end
end
}

--Occlupanid
SMODS.Joker {
    key = "breadclip",
    atlas = "My_Way_and_The_Highway",
    rarity = 2,
    pos = { x = 1, y = 2 },
    cost = 6,
    blueprint_compat = false,
    config = { extra = { bag_of_chips = 0 } },
    calculate = function(self, card, context)
        if G.GAME.current_round.hands_played == 0 and context.after then
                card.ability.extra.bag_of_chips = SMODS.calculate_round_score()
        end
        if G.GAME.current_round.hands_left == 0 and context.final_scoring_step then
            return {
                chips = card.ability.extra.bag_of_chips
            }
    end
end
}

-- Origami Fool
SMODS.Joker {
    key = "chance_card",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 2, y = 2 },
    config = { extra = { mult = -4, spacial = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.spacial } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.spacial == 5 then
                 G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                 card.ability.extra.spacial = card.ability.extra.spacial + 1
            end
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}

-- Eleven Words
SMODS.Joker {
    key = "pex_card",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 3, y = 2 },
    config = { extra = { xmult = 1 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.xmult = card.ability.extra.xmult * 1.1  
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}


-- Index Card
SMODS.Joker {
    key = "index_card",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 4, y = 2 },
    config = { extra = { mult = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then	    
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                            SMODS.add_card({ key = pseudorandom_element({ 'c_xiferp_hydrogen', 'c_xiferp_helium', 'c_xiferp_lithium', 'c_xiferp_beryllium', 'c_xiferp_boron', 'c_xiferp_carbon', 'c_xiferp_nitrogen', 'c_xiferp_oxygen', 'c_xiferp_fluorine', 'c_xiferp_neon', 'c_xiferp_sodium', 'c_xiferp_magnesium', 'c_xiferp_aluminum', 'c_xiferp_silicon', 'c_xiferp_phosphorus', 'c_xiferp_sulfur', 'c_xiferp_chlorine', 'c_xiferp_argon', 'c_xiferp_potassium', 'c_xiferp_calcium' }, 'studywell'  )} )
                        return true
                    end
                })) 
            end
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Record Shop
SMODS.Joker {
    key = "record",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    pos = { x = 7, y = 0 },
    add_to_deck = function(self, card, from_debuff)
       SMODS.add_card({ key = pseudorandom_element({ 'j_hit_the_road', 'j_seeing_double', 'j_xiferp_timeszero' }, 'center'  )} )
    end
}

--My Hero Zero
SMODS.Joker {
    key = "timeszero",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    pos = { x = 6, y = 1 },
    config = { extra = { repetitions = 9, odds = 20, mult = 10 }},
    calculate = function(self, card, context)
    if context.joker_main and context.cardarea == G.play then
        if SMODS.pseudorandom_probability(card, 'j_xiferp_timeszero', 1, card.ability.extra.odds) then
            if context.retrigger_joker_check then
                local other_joker = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then 
                        other_joker = G.jokers.cards[i - 1] 
                    end
                end
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        else
            return {
                mult = card.ability.extra.mult * #G.jokers.cards,
                xmult = 1 + (#G.jokers.cards / card.ability.extra.mult) 
            }
        end
    end
end
}

-- Radiocarbon
SMODS.Joker {
    key = "radiocarbon",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 1 },
    config = { extra = { xmult = 28 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult * 0.5  
        end
    end
}

--Chocolate Coins ('Those aren't make of chocolate, Komaru, those are actually just made of Lead.')
SMODS.Joker {
    key = "chocoins",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 6, y = 2 },
    config = { extra = { mult_loss = 1, mult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_loss } }
    end,
    add_to_deck = function(self, card, from_debuff)
           card.ability.extra.mult = card.ability.extra.mult * ((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0))
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.mult - card.ability.extra.mult_loss <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_loss } },
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Vending Machine
SMODS.Joker {
    key = "vending_machine",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 5, y = 4 },
    remove_from_deck = function(self, card, from_debuff)
           SMODS.add_card({ key = pseudorandom_element({ 'j_gros_michel', 'j_egg', 'j_ice_cream', 'j_cavendish', 'j_turtle_bean', 'j_diet_cola', 'j_popcorn', 'j_ramen', 'j_selzer', 'j_xiferp_chocoins', 'j_xiferp_sandwich', 'j_xiferp_alphabet' }, 'center'  )} )
    end
}

-- Not, In Fact, A Friend of Jimbo
SMODS.Joker {
    key = "tf_poker",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 5, y = 3 },
    calculate = function(self, card, context)
        if context.joker_main then
            local ace_check = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 14 then
                    ace_check = true
                    break
                end
            end
            if ace_check == false then
                local acingit_card = SMODS.add_card { set = "Base", rank = 'Ace', area = G.deck }
                return {
                    func = function()
                        SMODS.calculate_context({ playing_card_added = true, cards = { acingit_card } })
                    end
                }
            end
        end
    end
}

-- Joker Sudoker
SMODS.Joker {
    key = "sudoku",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 4, y = 1 },
    config = { extra = { xmult = 9, nine_amount = 9 } },
    loc_vars = function(self, info_queue, card)
        local nine_tally = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if playing_card:get_id() == 9 then 
                nine_tally = nine_tally + 1 
            end
        end
        return { vars = { card.ability.extra.xmult, card.ability.extra.nine_amount, nine_tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local nine_tally = 0
            for _, playing_card in pairs(G.playing_cards) do
                if playing_card:get_id() == 9 then 
                    nine_tally = nine_tally + 1 
                end
            end
            if nine_tally >= card.ability.extra.nine_amount then
                return {
                    xmult = card.ability.extra.xmult * math.floor( nine_tally / card.ability.extra.nine_amount)
                }
            end
        end
    end,
}

local alphabet = {}

for i = 1, 26 do
    alphabet[i] = string.char(string.byte('a') + i - 1)
end

local is_valid_letter = function(c)
    return string.byte('a') <= string.byte(c) and string.byte(c) <= string.byte('z')
end

-- Alphabet Soup
SMODS.Joker {
    key = "alphabet",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 1,
    cost = 3,
    pos = { x = 6, y = 4 },
    config = { extra = { xmult = 3.4, xmult_loss = 0.1, search = {} } },
    loc_vars = function(self, info_queue, card)
        local vars = { card.ability.extra.xmult, card.ability.extra.xmult_loss }
        for _, letter in ipairs(alphabet) do
            vars[#vars + 1] = card.ability.extra.search[letter] or false
        end
        return { vars = vars }
    end,
    calculate = function(self, card, context)
        if context.card_added and context.card.ability.set == "Joker" then
            local name = localize({ type = 'name_text', key = context.card.config.center.key, set = 'Joker' }) or ""
            name = name:lower()

            for c in name:gmatch(".") do
                if is_valid_letter(c) and not card.ability.extra.search[c] then
                    card.ability.extra.search[c] = true
                    card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
                end
                if card.ability.extra.xmult <= 1 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.FILTER
                    }
                end
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

-- United States Altas
SMODS.Joker {
    key = "altas",
    atlas = "stateside_flipbook",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 0 },
    config = { extra = { chips = 50 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then 
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

-- US City Altas
SMODS.Joker {
    key = "city_altas",
    atlas = "providence_flipbook",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 2 },
    config = { extra = { mult = 5.7 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then 
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Inscryptid
SMODS.Joker {
    key = "inscryptid",
    atlas = "elsewhere",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 0 },
    config = { extra = { mult = 2 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
	if context.joker_type_destroyed and context.card.ability.set == "Joker" then
	card.children.center:set_sprite_pos{ x = card.children.center.sprite_pos.x + 1, y = 0 }
        card.ability.extra.mult = card.ability.extra.mult + 2
    end
    if card.children.center.sprite_pos.x >= 50 then
        card.children.center:set_sprite_pos{ x = 49, y = 0 }
    end
    if context.joker_main then 
        return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- KamSandwich
SMODS.Joker {
    key = "kameron",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 7, y = 4 },
    config = { extra = { max = 43, min = 40, key = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize("randomline" .. card.ability.extra.key), localize("randomline" .. (20 + card.ability.extra.key)), card.ability.extra.min, card.ability.extra.max } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.key = pseudorandom("boardgaming" , 1, 20)
        end
        if context.joker_main then
            return {
                mult = 19 + (pseudorandom('xiferp_kameron', card.ability.extra.min, card.ability.extra.max)/100)
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_xiferp_road') then
                return true
            end
        end
        return false
    end
}

-- Battery
SMODS.Joker {
    key = "battery",
    atlas = "elsewhere",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 0, y = 1 },
    config = { extra = { enhance_points = 100 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.enhance_points } }
    end,
    calculate = function(self, card, context)
    if context.selling_card and not context.blueprint then
        local n = context.card.sell_cost * 3
        card.children.center:set_sprite_pos{ x = card.children.center.sprite_pos.x - n, y = 1 }
        card.ability.extra.enhance_points = card.ability.extra.enhance_points + n
    end
    local scoring_card = context.other_card
    if context.individual and context.cardarea == G.play then
        if not next(SMODS.get_enhancements(scoring_card)) and card.ability.extra.enhance_points > 0 then  
            local xiferp_a_salted = SMODS.poll_enhancement({guaranteed = true, type_key = 'shuffletheseed'})
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scoring_card:set_ability(xiferp_a_salted, nil, true)
                        return true
                    end
                }))
            if xiferp_a_salted == "m_wild" then
                card.children.center:set_sprite_pos{ x = card.children.center.sprite_pos.x + 1, y = 1 }
                card.ability.extra.enhance_points = card.ability.extra.enhance_points - 1
            elseif xiferp_a_salted == "m_bonus" or xiferp_a_salted == "m_mult" or xiferp_a_salted == "m_stone" then
                card.children.center:set_sprite_pos{ x = card.children.center.sprite_pos.x + 3, y = 1 }
                card.ability.extra.enhance_points = card.ability.extra.enhance_points - 3
            elseif xiferp_a_salted == "m_lucky" or xiferp_a_salted == "m_gold" then
                card.children.center:set_sprite_pos{ x = card.children.center.sprite_pos.x + 4, y = 1 }
                card.ability.extra.enhance_points = card.ability.extra.enhance_points - 4
            elseif xiferp_a_salted == "m_glass" or xiferp_a_salted == "m_steel" then
                card.children.center:set_sprite_pos{ x = card.children.center.sprite_pos.x + 6, y = 1 }
                card.ability.extra.enhance_points = card.ability.extra.enhance_points - 6
            else
                card.children.center:set_sprite_pos{ x = card.children.center.sprite_pos.x + 7, y = 1 }
                card.ability.extra.enhance_points = card.ability.extra.enhance_points - 7
            end
        end
    end
    if card.children.center.sprite_pos.x + card.ability.extra.enhance_points ~= 100 then
        card.children.center:set_sprite_pos{ x = 100 - card.ability.extra.enhance_points, y = 1 }
    end
    if card.children.center.sprite_pos.x > 100 then
        card.children.center:set_sprite_pos{ x = 100, y = 1 }
        card.ability.extra.enhance_points = 0
    end
    if card.children.center.sprite_pos.x < 0 then
        card.children.center:set_sprite_pos{ x = 0, y = 1 }
        card.ability.extra.enhance_points = 100
    end
end
}

--Tea
SMODS.Joker {
    key = "sweettea",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    pos = { x = 2, y = 5 },
    config = { extra = { xmult_loss = 0.5, xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_loss } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.xmult - card.ability.extra.xmult_loss <= 1 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
                return {
                    message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.xmult_loss } },
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

-- Word Ladder
SMODS.Joker {
    key = "wordladder",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 3 },
    config = { extra = { chips = 10, mult = 6, type = 'High Card' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
    if context.joker_main then 
        return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    if next(SMODS.find_mod('aikoyorisshenanigans')) then
        for i = 3, 45 do
            card.ability.extra.type = "akyrs_"..i.."-letter Word"
            if context.before and not context.blueprint and next(context.poker_hands[card.ability.extra.type]) then
                print("up a rung on the word ladder")
                card.ability.extra.chips = card.ability.extra.chips + 2
                card.ability.extra.mult = card.ability.extra.mult + 2
            end
        end
    end
end
}

-- Trash Can
SMODS.Joker {
    key = "trashcan",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 5 },
    config = { extra = { chips = 0, joker_to_the_left = 'j_xiferp_hydrogen', my_pos = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.joker_to_the_left } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    card.ability.extra.my_pos = i
                    break
                end
            end
	        if G.jokers.cards[card.ability.extra.my_pos - 1] then
		        card.ability.extra.joker_to_the_left = G.jokers.cards[card.ability.extra.my_pos - 1].config.center_key
	        end
        end
        if context.joker_main then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    card.ability.extra.my_pos = i
                    break
                end
            end
            if G.jokers.cards[card.ability.extra.my_pos - 1] and G.jokers.cards[card.ability.extra.my_pos - 1].config.center_key ~= card.ability.extra.joker_to_the_left and not G.jokers.cards[card.ability.extra.my_pos - 1].getting_sliced then
                local sliced_card = G.jokers.cards[card.ability.extra.my_pos - 1]
                SMODS.destroy_cards(sliced_card)
                card.ability.extra.chips = card.ability.extra.chips + 6
                sliced_card.getting_sliced = true
            end
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

-- Score Switch
SMODS.Joker {
    key = "switch",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    pos = { x = 5, y = 5 },
    config = { extra = { xmult = 0 } },
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left ~= 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

-- Elemental Scientist
SMODS.Joker {
    key = "science",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 0, y = 1 },
    config = { extra = { mult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.xiferp_element or 0) } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "xiferp_element" then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.consumeable_usage_total.xiferp_element * card.ability.extra.mult } },
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult *
                    (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.xiferp_element or 0)
            }
        end
    end,
}

--House Of Cards
SMODS.Joker {
    key = "house",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 1, y = 3 },
    config = { extra = { mult = 0 } },
    loc_vars = function(self, info_queue, card)
        local house_card = G.GAME.current_round.xiferp_house_cards or { rank = 'Ace', suit = 'Spades' }
        return { vars = { card.ability.extra.mult, localize(house_card.rank, 'ranks'), localize(house_card.suit, 'suits_plural'), colours = { G.C.SUITS[house_card.suit] } } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.mult = card.ability.extra.mult + 1
            if context.other_card:get_id() == G.GAME.current_round.xiferp_house_cards.id and
            context.other_card:is_suit(G.GAME.current_round.xiferp_house_cards.suit) then
                card.ability.extra.mult = 0
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Balatro But Really Really Fast
SMODS.Joker {
    key = "jojostand",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 4 },
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.playing_card_added and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + #context.cards * card.ability.extra.mult
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            }
        end
        if context.remove_playing_cards and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + #context.cards * card.ability.extra.mult
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}

-- Dark Comedy
SMODS.Joker {
    key = "daynan",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 4,
    cost = 18,
    pos = { x = 4, y = 3 },
    config = { extra = { xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].config.center.key ~= 'j_joker' and G.jokers.cards[i].config.center.key ~= 'j_xiferp_daynan' and not SMODS.is_eternal(G.jokers.cards[i], card) then 
                    local joker_to_destroy = G.jokers.cards[i]
                    if joker_to_destroy then
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            (context.blueprint_card or card):juice_up(0.8, 0.8)
                            joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                            SMODS.add_card({ key = 'j_joker' } )
                            return true
                        end
                    }))
                end
                card.ability.extra.xmult = card.ability.extra.xmult + 4
            end
        end
        return {
            xmult = card.ability.extra.xmult
        }
    end
end,
}

-- Salted Ghost
SMODS.Joker {
    key = "ghostsalt",
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    pos = { x = 4, y = 4 },
    calculate = function(self, card, context)
        if context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if context.full_hand ~= context.scoring_hand then 
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'xiferp_ghostsalt'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_tarot'),
                }
            end
        end
    end,
}

local function reset_xiferp_house_cards()
    G.GAME.current_round.xiferp_house_cards = { rank = 'Ace', suit = 'Spades' }
    local valid_house_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
            valid_house_cards[#valid_house_cards + 1] = playing_card
        end
    end
    local house_card = pseudorandom_element(valid_house_cards, 'vremade_idol' .. G.GAME.round_resets.ante)
    if house_card then
        G.GAME.current_round.xiferp_house_cards.rank = house_card.base.value
        G.GAME.current_round.xiferp_house_cards.suit = house_card.base.suit
        G.GAME.current_round.xiferp_house_cards.id = house_card.base.id
    end
end

function SMODS.current_mod.reset_game_globals(run_start)
    reset_xiferp_house_cards()    -- See House Of Cards
end