--Creates an atlas for cards to use
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
        if context.scoring_hand[1] and not context.blueprint then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local copied_card = copy_card(context.scoring_hand[1], nil, nil, G.playing_card)
            SMODS.modify_rank(copied_card, pseudorandom_element(xiferp_card_rank_roll, {-1, 0, 1}))
            SMODS.change_base(copied_card, pseudorandom_element(xiferp_card_suit_roll, {'D','C','H','S'}))
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
                func = function() -- This is for timing purposes, it runs after the message
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
            local xiferp_spade_change = pseudorandom_element(G.hand.cards, xiferp_astro_card)
            SMODS.change_base(xiferp_spade_change, 'S')
        end
    end
}

