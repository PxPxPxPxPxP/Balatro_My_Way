SMODS.Atlas {
	key = "Thats_Me_In_The_Corner",
	path = "7418529630.png",
	px = 71,
	py = 95
}

SMODS.Seal {
    key = "radi",
    atlas = "Thats_Me_In_The_Corner",
    badge_colour = HEX ('808000'),
    config = { extra = { x_mult = 2, odds = 15 } },
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 8, card.ability.seal.extra.odds, 'xiferp_radi')
        return { vars = { numerator, denominator, card.ability.seal.extra.x_mult } }
    end,   
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                if SMODS.pseudorandom_probability(card, 'xiferp_radi', 8, card.ability.seal.extra.odds) then
                    SMODS.destroy_cards(card, nil, nil, true)
                end
            return {
                x_mult = card.ability.seal.extra.x_mult
            }
        end
    end
}

-- Letter Seal
SMODS.Seal {
    key = 'letter',
    atlas = "Thats_Me_In_The_Corner",
    pos = { x = 1, y = 0 },
    badge_colour = HEX('600099'),    
    calculate = function(self, card, context)
         if context.main_scoring then
            if #context.scoring_hand == 3 then
            return { 
                chips = 10,
                mult = 10
            }
        end
            if #context.scoring_hand == 4 then
            return { 
                chips = 17,
                mult = 13
            }
        end
            if #context.scoring_hand == 5 then
            return { 
                chips = 29,
                mult = 18
            }
	    end    
    end
end
}

-- Paved Road
SMODS.Enhancement {
    key = 'road',
    atlas = 'Enhancement',
    pos = { x = 0, y = 0 },
    config = { extra = { x_mult = 3, odds = 8 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_xiferp_road')
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
        if context.poker_hands["Straight"] then 
            return {xmult = 3}
        end
        if SMODS.pseudorandom_probability(card, 'xiferp_road', 1, card.ability.extra.odds) then
             scored_card:set_ability('m_xiferp_pothole', nil, true)
        end
    end
end
}

-- Pothole
SMODS.Enhancement {
    key = 'pothole',
    atlas = 'Enhancement',
    pos = { x = 2, y = 0 },
    config = { extra = { x_mult = 2 } },
    calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
        if #context.full_hand <= 4 then
            return {xmult = 2}
        end
    end
end
}
local four_fingers = SMODS.four_fingers
function SMODS.four_fingers(hand_type)
    if hand_type == "straight" then
        for k, v in ipairs(G.play and next(G.play.cards) and G.play.cards or G.hand.highlighted) do
            if SMODS.has_enhancement(v, 'm_xiferp_pothole') then
                return 4
            end
	end
    end
    return four_fingers(hand_type)
end