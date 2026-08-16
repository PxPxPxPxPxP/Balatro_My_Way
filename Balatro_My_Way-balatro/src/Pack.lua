SMODS.Atlas {
	key = "Elements_of_the_Round_Table",
	path = "1357924680.png",
	px = 57,
	py = 93
}

SMODS.Booster {
    key = "mendeleev",
    atlas = "Elements_of_the_Round_Table",
    weight = 1,
    kind = 'xiferp_Element', 
    cost = 8,
    pos = { x = 0, y = 0 },
    config = { extra = 8, choose = 2 },
    group_key = "k_element_pack",
    select_card = 'consumeables',
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "xiferp_Element",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "xiferp_ele"
        }
    end
}