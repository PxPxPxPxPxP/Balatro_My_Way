SMODS.Atlas {
	key = "lunarmonth",
	path = "9874563210.png",
	px = 71,
	py = 95
}

SMODS.Consumable {
    key = "moon",
    set = "Planet",
    cost = 3,
    atlas = "lunarmonth",
    pos = { x = 0, y = 0 },
    config = { hand_type = 'xiferp_royal_sampler', softlock = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}