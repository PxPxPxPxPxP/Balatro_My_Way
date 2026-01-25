SMODS.Atlas {
	key = "My_Way_and_The_Highway",
	path = "1234567890.png",
	px = 71,
	py = 95
}

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
                message = localize('k_duped_ex'),
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
    atlas = "My_Way_and_The_Highway",
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    pos = { x = 0, y = 1 },
    config = { extra = { creates = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            rarity = 'Uncommon',
                            key_append = 'vremade_riff_raff'                       
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
    end,
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
            print(card.ability.extra.target_suit)
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
        return { vars = card.ability.extra.mult }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
             for i = 1, #G.jokers.cards do
                 if G.jokers.cards[i].config.center.key == 'j_xiferp_lhc' then 
                     SMODS.add_card { key = 'c_xiferp_bolognium' }
                 end
             end
        end
        if context.individual and context.cardarea == G.play and context.other_card == context.full_hand[#context.full_hand] and context.full_hand[1]:get_id() == context.full_hand[#context.full_hand]:get_id() then
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
    config = { extra = { mult = -4 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.jokers.config.card_limit <= 5 then
                 G.jokers.config.card_limit = G.jokers.config.card_limit + 1
            end
            return {
                mult = card.ability.extra.mult
            }
        end
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

--40 Day Survival
--SMODS.Joker {
--  key = "feast",
--  atlas = "My_Way_and_The_Highway",
--  rarity = 3,
--  pos = { x = 3, y = 3 },
--  cost = 8,
--  blueprint_compat = false,
--  config = { extra = { xmult = 40, type = 'High Card' } },
--  loc_vars = function(self, info_queue, card)
--      return { vars = card.ability.extra.xmult }
--  end,
--      calculate = function(self, card, context)
--      if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
--          local suits = {
--              ['Hearts'] = 0,
--              ['Diamonds'] = 0,
--              ['Spades'] = 0,
--              ['Clubs'] = 0
--          }
--          for i = 1, #context.scoring_hand do
--              if not SMODS.has_any_suit(context.scoring_hand[i]) then
--                  if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then
--                      suits["Hearts"] = suits["Hearts"] + 1
--                  elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0 then
--                      suits["Diamonds"] = suits["Diamonds"] + 1
--                  elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0 then
--                      suits["Spades"] = suits["Spades"] + 1
--                  elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0 then
--                      suits["Clubs"] = suits["Clubs"] + 1
--                  end
--              end
--          end
--          for i = 1, #context.scoring_hand do
--              if SMODS.has_any_suit(context.scoring_hand[i]) then
--                  if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then
--                      suits["Hearts"] = suits["Hearts"] + 1
--                  elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
--                      suits["Diamonds"] = suits["Diamonds"] + 1
--                  elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0 then
--                      suits["Spades"] = suits["Spades"] + 1
--                  elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0 then
--                      suits["Clubs"] = suits["Clubs"] + 1
--                  end
--              end
--          end
--          if suits["Hearts"] > 0 and
--              suits["Diamonds"] > 0 and
--              suits["Spades"] > 0 and
--              suits["Clubs"] > 0 then
--              return {
--                  xmult = card.ability.extra.xmult
--              }
--          end
--      end
--  end
--}