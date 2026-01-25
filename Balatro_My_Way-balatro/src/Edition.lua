SMODS.Atlas {
	key = "Thats_Me_In_The_Corner",
	path = "7418529630.png",
	px = 71,
	py = 95
}

SMODS.Sticker {
    key = "radi",
    atlas = "Thats_Me_In_The_Corner",
    badge_colour = HEX ('808000'),
    config = { x_mult = 2, prob = 15 },
    pos = { x = 0, y = 0 },
    should_apply = function(self, card, center, area, bypass_roll)
        return false
    end,
    apply = function(self, card, val)
        card.ability[self.key] = val
        if card.ability[self.key] then 
            card.ability.prob = 15
            card.ability.x_mult = 2
        end
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 8, card.ability.prob, 'e_xiferp_radi')
        return { vars = { card.ability.x_mult, numerator, denominator } }
    end,
        calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'e_xiferp_radi', 8, card.ability.prob) then
                SMODS.destroy_cards(card, nil, nil, true)
                return nil
            end
            return {
                x_mult = card.ability.x_mult
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