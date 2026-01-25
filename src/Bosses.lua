SMODS.Atlas {
	key = "corporate_entity_overlord",
	path = "1472583690.png",    
    atlas_table = 'ANIMATION_ATLAS',
    frames = 1,
	px = 128,
	py = 128
}

SMODS.Blind {
    name = "boss_quiz",
    key = "boss_quiz",
    atlas = "corporate_entity_overlord",
    pos = { y = 0 },
    dollars = 7,
    mult = 2,
    boss = { min = 1 },
    loc_txt = {
        name = "The Splapp",
        text = {
            "Answer an impossible question",
        }
    },

    boss_colour = HEX('cd9e12'),

    recalc_debuff = function(self)
        quizLoad()
    end
}


