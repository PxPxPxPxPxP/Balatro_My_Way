SMODS.Atlas {
	key = "Golden_Brick_Road",
	path = "0987654321.png",
	px = 71,
	py = 95
}

SMODS.ConsumableType {
    key = 'xiferp_Element',
    loc_txt = {
      name = "Element Cards"
    },
    primary_colour = HEX('FFFFFF'),
    secondary_colour = HEX('00DD00'),
    shop_rate = 4
}

-- Aether
SMODS.Consumable {
    key = "aether",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 0 }},  
    can_use = function(self, card)
        return (card.area == G.consumeables)
    end,
    use = function(self, card, area, copier)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                        SMODS.add_card({ set = 'xiferp_Element' })
                    return true
                end
            }))
        end,    
    loc_txt = {
        name = 'Aether',
                text = {
                    'Creates a random element card',
                },
            }

}    

-- Hydrogen
SMODS.Consumable {
    key = "hydrogen",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 0 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 1 }},  
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Hydrogen',
                text = {
                    'Destroys one random card and',
                    'adds +5 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_flike_chips = (G.GAME.xiferp_flike_chips or 0) + 5            
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        SMODS.destroy_cards(card_to_destroy)
    end      
}

-- Helium
SMODS.Consumable {
    key = "helium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 15, y = 0 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 2 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Helium',
                text = {
                    'Adds +5 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_nobelgas_chips = (G.GAME.xiferp_nobelgas_chips or 0) + 5            
    end      
}

-- Lithium
SMODS.Consumable {
    key = "lithium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 16, y = 0 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 3 }},
    can_use = function(self, card)
      return G.GAME.blind.in_blind
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_alkimetal_chips = (G.GAME.xiferp_alkimetal_chips or 0) + 5      
          local alki_card = SMODS.add_card { set = "Base" }
          G.GAME.blind:debuff_card(alki_card)
          G.hand:sort()
          SMODS.calculate_context({ playing_card_added = true, cards = { alki_card } })
    end,
    loc_txt = {
        name = 'Lithium',
                text = {
                    'Adds +5 chips for the hand',
                    'after this is used, and adds one',
                    'new card to the deck',
                },
            },
}

-- Beryllium
SMODS.Consumable {
    key = "beryllium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 17, y = 0 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 4 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Beryllium',
                text = {
                    'Gives 1 random card a random suit',
                    'and adds +5 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_alkemetal_chips = (G.GAME.xiferp_alkemetal_chips or 0) + 5        
            local suit = pseudorandom_element(SMODS.Suits, 'aniceoutfit').key
            local card_to_change = pseudorandom_element(G.hand.cards, 'shufflethedeck')
            assert(SMODS.change_base(card_to_change, suit))
        end
}

-- Boron
SMODS.Consumable {
    key = "boron",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 10, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 5 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_smetal_chips = (G.GAME.xiferp_smetal_chips or 0) + 3
    end,
    loc_txt = {
        name = 'Boron',
                text = {
                    'Adds +3 chips per Queen for',
                    'the hand after this is used',
                },
            },

}

-- Carbon
SMODS.Consumable {
    key = "carbon",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 11, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 6 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_nmetal_chips = (G.GAME.xiferp_nmetal_chips or 0) + 4
    end,
    loc_txt = {
        name = 'Carbon',
                text = {
                    'Adds +4 chips per King for',
                    'the hand after this is used',
                },
            },

}

-- Nitrogen
SMODS.Consumable {
    key = "nitrogen",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 12, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 7 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_nmetal_chips = (G.GAME.xiferp_nmetal_chips or 0) + 5
    end,
    loc_txt = {
        name = 'Nitrogen',
                text = {
                    'Adds +5 chips per King for',
                    'the hand after this is used',
                },
            },

}

-- Oxygen
SMODS.Consumable {
    key = "oxygen",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 13, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 8 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_nmetal_chips = (G.GAME.xiferp_nmetal_chips or 0) + 6
    end,
    loc_txt = {
        name = 'Oxygen',
                text = {
                    'Adds +6 chips per King for',
                    'the hand after this is used',
                },
            },

}

-- Fluorine
SMODS.Consumable {
    key = "fluorine",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 9 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Fluorine',
                text = {
                    'Destroys one random card and',
                    'adds +10 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_flike_chips = (G.GAME.xiferp_flike_chips or 0) + 10            
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        SMODS.destroy_cards(card_to_destroy)
    end      
}

-- Neon
SMODS.Consumable {
    key = "neon",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 15, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 10 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Neon',
                text = {
                    'Adds +10 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_nobelgas_chips = (G.GAME.xiferp_nobelgas_chips or 0) + 10           
    end      
}

-- Sodium
SMODS.Consumable {
    key = "sodium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 16, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 11 }},
    can_use = function(self, card)
      return G.GAME.blind.in_blind
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_alkimetal_chips = (G.GAME.xiferp_alkimetal_chips or 0) + 10
          local alki_card = SMODS.add_card { set = "Base" }
          G.GAME.blind:debuff_card(alki_card)
          G.hand:sort()
          SMODS.calculate_context({ playing_card_added = true, cards = { alki_card } })
    end,
    loc_txt = {
        name = 'Sodium',
                text = {
                    'Adds +10 chips for the hand',
                    'after this is used, and adds one',
                    'new card to the deck',
                },
            },
}

-- Magnesium
SMODS.Consumable {
    key = "magnesium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 17, y = 1 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 12 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Magnesium',
                text = {
                    'Gives 1 random card a random seal',
                    'and adds +10 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_alkemetal_chips = (G.GAME.xiferp_alkemetal_chips or 0) + 10        
            local xiferp_seal_the_deal = SMODS.poll_seal({guaranteed = true, type_key = 'shuffletheseed'})
            local card_to_change = pseudorandom_element(G.hand.cards, 'shufflethedeck')
                      G.E_MANAGER:add_event(Event({
                           func = function()
                                card_to_change:set_seal(xiferp_seal_the_deal, nil, true)
                           return true
                     end
             }))  
   end 
}

-- Aluminum
SMODS.Consumable {
    key = "aluminum",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 10, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 13 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_metal_chips = (G.GAME.xiferp_metal_chips or 0) + 3
    end,
    loc_txt = {
        name = 'Aluminum',
                text = {
                    'Adds +3 chips per King for',
                    'the hand after this is used',
                },
            },
}

-- Silicon
SMODS.Consumable {
    key = "silicon",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 11, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 14 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_smetal_chips = (G.GAME.xiferp_smetal_chips or 0) + 4
    end,
    loc_txt = {
        name = 'Silicon',
                text = {
                    'Adds +4 chips per Queen for',
                    'the hand after this is used',
                },
            },
}


-- Phosphorus
SMODS.Consumable {
    key = "phosphorus",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 12, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 15 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_nmetal_chips = (G.GAME.xiferp_nmetal_chips or 0) + 5
    end,
    loc_txt = {
        name = 'Phosphorus',
                text = {
                    'Adds +5 chips per King for',
                    'the hand after this is used',
                },
            },

		
}

-- Sulfur
SMODS.Consumable {
    key = "sulfur",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 13, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 16 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_nmetal_chips = (G.GAME.xiferp_nmetal_chips or 0) + 6
    end,
    loc_txt = {
        name = 'Sulfur',
                text = {
                    'Adds +6 chips per King for',
                    'the hand after this is used',
                },
            },

		
}

-- Chlorine
SMODS.Consumable {
    key = "chlorine",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 17 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Chlorine',
                text = {
                    'Destroys 1 random card in hand and',
                    'adds +20 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_flike_chips = (G.GAME.xiferp_flike_chips or 0) + 20            
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        SMODS.destroy_cards(card_to_destroy)
    end      
}

-- Argon
SMODS.Consumable {
    key = "argon",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 16, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 19 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Argon',
                text = {
                    'Adds +20 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_nobelgas_chips = (G.GAME.xiferp_nobelgas_chips or 0) + 20            
    end    
}

-- Potassium
SMODS.Consumable {
    key = "potassium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 15, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 18 }},
    can_use = function(self, card)
      return G.GAME.blind.in_blind
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_alkimetal_chips = (G.GAME.xiferp_alkimetal_chips or 0) + 20
          local alki_card = SMODS.add_card { set = "Base" }
          G.GAME.blind:debuff_card(alki_card)
          G.hand:sort()
          SMODS.calculate_context({ playing_card_added = true, cards = { alki_card } })
    end,
    loc_txt = {
        name = 'Potassium',
                text = {
                    'Adds +20 chips for the hand',
                    'after this is used, and adds one',
                    'new card to the deck',
                },
            },
}

-- Calcium
SMODS.Consumable {
    key = "calcium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 17, y = 2 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 20 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Calcium',
                text = {
                    'Changes 1 random card to a random rank',
                    'and adds +20 chips to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_alkemetal_chips = (G.GAME.xiferp_alkemetal_chips or 0) + 5        
            local rank = pseudorandom_element(SMODS.Ranks, 'uppydownybits').key
            local card_to_change = pseudorandom_element(G.hand.cards, 'shufflethedeck')
            assert(SMODS.change_base(card_to_change, nil, rank))
        end
}

-- Scandium
SMODS.Consumable {
    key = "scandium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 0, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 21 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal1_mult = (G.GAME.xiferp_tmetal1_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Scandium',
                text = {
                    'Adds +5 mult per 2 for',
                    'the hand after this is used',
                },
            },
}

-- Titanium
SMODS.Consumable {
    key = "titanium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 1, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 22 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal2_mult = (G.GAME.xiferp_tmetal2_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Titanium',
                text = {
                    'Adds +5 mult per 3 for',
                    'the hand after this is used',
                },
            },
        
}

-- Vanadium
SMODS.Consumable {
    key = "vanadium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 2, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 23 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal3_mult = (G.GAME.xiferp_tmetal3_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Vanadium',
                text = {
                    'Adds +5 mult per 4 for',
                    'the hand after this is used',
                },
            },
        
}

-- Chromium
SMODS.Consumable {
    key = "chromium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 3, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 24 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal4_mult = (G.GAME.xiferp_tmetal4_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Chromium',
                text = {
                    'Adds +5 mult per 5 for',
                    'the hand after this is used',
                },
            },
        
}

-- Manganese
SMODS.Consumable {
    key = "manganese",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 4, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 25 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal5_mult = (G.GAME.xiferp_tmetal5_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Manganese',
                text = {
                    'Adds +5 mult per 6 for',
                    'the hand after this is used',
                },
            },
        
}

-- Iron
SMODS.Consumable {
    key = "iron",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 5, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 26 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal6_mult = (G.GAME.xiferp_tmetal6_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Iron',
                text = {
                    'Adds +5 mult per 7 for',
                    'the hand after this is used',
                },
            },
        
}

-- Cobalt
SMODS.Consumable {
    key = "cobalt",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 7, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 28 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal7_mult = (G.GAME.xiferp_tmetal7_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Cobalt',
                text = {
                    'Adds +5 mult per 8 for',
                    'the hand after this is used',
                },
            },
        
}

-- Nickel
SMODS.Consumable {
    key = "nickel",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 6, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 27 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal8_mult = (G.GAME.xiferp_tmetal8_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Nickel',
                text = {
                    'Adds +5 mult per 9 for',
                    'the hand after this is used',
                },
            },
        
}

-- Copper
SMODS.Consumable {
    key = "copper",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 8, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 29 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal9_mult = (G.GAME.xiferp_tmetal9_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Copper',
                text = {
                    'Adds +5 mult per 10 for',
                    'the hand after this is used',
                },
            },
}
  
-- Zinc
SMODS.Consumable {
    key = "zinc",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 9, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 30 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal10_mult = (G.GAME.xiferp_tmetal10_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Zinc',
                text = {
                    'Adds +5 mult per Ace for',
                    'the hand after this is used',
                },
            },
}

-- Gallium
SMODS.Consumable {
    key = "gallium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 10, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 31 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_metal_mult = (G.GAME.xiferp_metal_mult or 0) + 3
    end,
    loc_txt = {
        name = 'Gallium',
                text = {
                    'Adds +3 mult per Jack for',
                    'the hand after this is used',
                },
            },
}

-- Germanium
SMODS.Consumable {
    key = "germanium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 11, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 32 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_smetal_mult = (G.GAME.xiferp_smetal_mult or 0) + 4
    end,
    loc_txt = {
        name = 'Germanium',
                text = {
                    'Adds +4 mult per Queen for',
                    'the hand after this is used',
                },
            },
}

-- Arsenic
SMODS.Consumable {
    key = "arsenic",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 12, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 33 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_smetal_mult = (G.GAME.xiferp_smetal_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Arsenic',
                text = {
                    'Adds +5 mult per Queen for',
                    'the hand after this is used',
                },
            },
}

-- Selenium
SMODS.Consumable {
    key = "selenium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 13, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 34 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_nmetal_mult = (G.GAME.xiferp_nmetal_mult or 0) + 6
    end,
    loc_txt = {
        name = 'Selenium',
                text = {
                    'Adds +6 mult per King for',
                    'the hand after this is used',
                },
            },

}

-- Bromine
SMODS.Consumable {
    key = "bromine",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 35 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Bromine',
                text = {
                    'Destroys 1 random card in hand and',
                    'adds +5 mult to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_flike_mult = (G.GAME.xiferp_flike_mult or 0) + 5           
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        SMODS.destroy_cards(card_to_destroy)
    end      
}

-- Krypton
SMODS.Consumable {
    key = "krypton",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 15, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 36 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Krypton',
                text = {
                    'Adds +5 mult to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_nobelgas_mult = (G.GAME.xiferp_nobelgas_mult or 0) + 5            
    end    
}

-- Rubidium
SMODS.Consumable {
    key = "rubidium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 16, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 37 }},
    can_use = function(self, card)
      return G.GAME.blind.in_blind
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_alkimetal_mult = (G.GAME.xiferp_alkimetal_mult or 0) + 5
          local alki_card = SMODS.add_card { set = "Base" }
          G.GAME.blind:debuff_card(alki_card)
          G.hand:sort()
          SMODS.calculate_context({ playing_card_added = true, cards = { alki_card } })
    end,
    loc_txt = {
        name = 'Rubidium',
                text = {
                    'Adds +5 mult for the hand',
                    'after this is used, and adds one',
                    'new card to the deck',
                },
            },
}
      
-- Strontium
SMODS.Consumable {
    key = "strontium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 17, y = 3 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 38 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Strontium',
                text = {
                    'Gives 1 random card a random enhancement',
                    'and adds +5 mult to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_alkemetal_mult = (G.GAME.xiferp_alkemetal_mult or 0) + 5        
            local xiferp_up_a_step = SMODS.poll_enhancement({guaranteed = true, type_key = 'shuffletheseed'})
            local card_to_change = pseudorandom_element(G.hand.cards, 'shufflethedeck')
                      G.E_MANAGER:add_event(Event({
                           func = function()
                                card_to_change:set_ability(xiferp_up_a_step, nil, true)
                           return true
                     end
             }))  
        end   
}

-- Yttrium
SMODS.Consumable {
    key = "yttrium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 0, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 39 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal1_mult = (G.GAME.xiferp_tmetal1_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Yttrium',
                text = {
                    'Adds +10 mult per 2 for',
                    'the hand after this is used',
                },
            },
}

-- Zirconium
SMODS.Consumable {
    key = "zirconium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 1, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 40 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal2_mult = (G.GAME.xiferp_tmetal2_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Zirconium',
                text = {
                    'Adds +10 mult per 3 for',
                    'the hand after this is used',
                },
            },
}

-- Niobium
SMODS.Consumable {
    key = "niobium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 2, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 41 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal3_mult = (G.GAME.xiferp_tmetal3_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Niobium',
                text = {
                    'Adds +10 mult per 4 for',
                    'the hand after this is used',
                },
            },
}

-- Molybdenum
SMODS.Consumable {
    key = "molybdenum",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 3, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 42 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal4_mult = (G.GAME.xiferp_tmetal4_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Molybdenum',
                text = {
                    'Adds +10 mult per 5 for',
                    'the hand after this is used',
                },
            },
}


-- Technetium
SMODS.Consumable {
    key = "technetium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 4, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { odds = 64, element_no = 43 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_technetium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal5_mult = (G.GAME.xiferp_tmetal5_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Technetium',
                text = {
                    'Adds +10 mult per 6 for',
                    'the hand after this is used',
                    '(1/6 chance to radioactively decay)',
                },
            },   
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_technetium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_ruthenium' })
        end
    end
end
}

-- Ruthenium
SMODS.Consumable {
    key = "ruthenium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 5, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 44 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal6_mult = (G.GAME.xiferp_tmetal6_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Ruthenium',
                text = {
                    'Adds +10 mult per 7 for',
                    'the hand after this is used',
                },
            },
        
}

-- Rhodium
SMODS.Consumable {
    key = "rhodium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 6, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 45 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal7_mult = (G.GAME.xiferp_tmetal7_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Rhodium',
                text = {
                    'Adds +10 mult per 8 for',
                    'the hand after this is used',
                },
            },
}

-- Palladium
SMODS.Consumable {
    key = "palladium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 7, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 46 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal8_mult = (G.GAME.xiferp_tmetal8_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Palladium',
                text = {
                    'Adds +10 mult per 9 for',
                    'the hand after this is used',
                },
            },
}

-- Silver
SMODS.Consumable {
    key = "silver",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 8, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 47 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal9_mult = (G.GAME.xiferp_tmetal9_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Silver',
                text = {
                    'Adds +10 mult per 10 for',
                    'the hand after this is used',
                },
            },
}

-- Cadmium
SMODS.Consumable {
    key = "cadmium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 9, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 48 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal10_mult = (G.GAME.xiferp_tmetal10_mult or 0) + 10
    end,
    loc_txt = {
        name = 'Cadmium',
                text = {
                    'Adds +10 mult per Ace for',
                    'the hand after this is used',
                },
            },
}

-- Indium
SMODS.Consumable {
    key = "indium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 10, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 49 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_metal_mult = (G.GAME.xiferp_metal_mult or 0) + 3
    end,
    loc_txt = {
        name = 'Indium',
                text = {
                    'Adds +3 mult per Jack for',
                    'the hand after this is used',
                },
            },

		
}

-- Tin
SMODS.Consumable {
    key = "tin",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 11, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 50 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_metal_mult = (G.GAME.xiferp_metal_mult or 0) + 4
    end,
    loc_txt = {
        name = 'Tin',
                text = {
                    'Adds +4 mult per Jack for',
                    'the hand after this is used',
                },
            },

		
}

-- Antimony
SMODS.Consumable {
    key = "antimony",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 12, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 51 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_smetal_mult = (G.GAME.xiferp_smetal_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Antimony',
                text = {
                    'Adds +5 mult per Queen for',
                    'the hand after this is used',
                },
            },
}

-- Tellurium
SMODS.Consumable {
    key = "tellurium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 53 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_smetal_mult = (G.GAME.xiferp_smetal_mult or 0) + 6
    end,
    loc_txt = {
        name = 'Tellurium',
                text = {
                    'Adds +6 mult per Queen for',
                    'the hand after this is used',
                },
            },
}

-- Iodine
SMODS.Consumable {
    key = "iodine",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 13, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 52 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Iodine',
                text = {
                    'Destroys 1 random card in hand and',
                    'adds +10 mult to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_flike_mult = (G.GAME.xiferp_flike_mult or 0) + 10           
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        SMODS.destroy_cards(card_to_destroy)
    end      
}

-- Xenon
SMODS.Consumable {
    key = "xenon",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 15, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 54 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Xenon',
                text = {
                    'Adds +10 mult to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_nobelgas_mult = (G.GAME.xiferp_nobelgas_mult or 0) + 10            
    end    
}

-- Cesium
SMODS.Consumable {
    key = "cesium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 16, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 55 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_alkimetal_mult = (G.GAME.xiferp_alkimetal_mult or 0) + 10 
          local alki_card = SMODS.add_card { set = "Base" }
          G.GAME.blind:debuff_card(alki_card)
          G.hand:sort()
          SMODS.calculate_context({ playing_card_added = true, cards = { alki_card } })
    end,
    loc_txt = {
        name = 'Cesium',
                text = {
                    'Adds +10 mult for the hand',
                    'after this is used, and adds one',
                    'new card to the deck',
                },
            },
}

-- Barium
SMODS.Consumable {
    key = "barium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 17, y = 4 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 56 }},
    can_use = function(self, card)
      return true
    end,    
    loc_txt = {
        name = 'Barium',
                text = {
                    'Gives 1 random card a random edition',
                    'and adds +10 mult to your next hand.',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_alkemetal_mult = (G.GAME.xiferp_alkemetal_mult or 0) + 10
        local card_to_change = pseudorandom_element(G.hand.cards, 'shufflethedeck')
        local xiferp_edition = poll_edition('xiferp_barium', nil, true, true, { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                  G.E_MANAGER:add_event(Event({
                        func = function()
                            card_to_change:set_edition(xiferp_edition, true)
                       return true
                 end
             }))  
        end   
}

-- Lanthanides
SMODS.Consumable {
    key = "lanthanides",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 0, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 114 }},  
    can_use = function(self, card)
        return (card.area == G.consumeables)
    end,
    use = function(self, card, area, copier)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                        SMODS.add_card({ key = pseudorandom_element({ 'c_xiferp_lanthanum', 'c_xiferp_cerium', 'c_xiferp_praseodymium', 'c_xiferp_neodymium', 'c_xiferp_promethium', 'c_xiferp_samarium', 'c_xiferp_europium', 'c_xiferp_gadolinium', 'c_xiferp_terbium', 'c_xiferp_dysprosium', 'c_xiferp_holmium', 'c_xiferp_erbium', 'c_xiferp_thulium', 'c_xiferp_ytterbium', 'c_xiferp_lutetium' }, 'Lanthanide_pull'  )} )
                    return true
                end
            }))
        end,    
    loc_txt = {
        name = 'Lanthanides',
                text = {
                    'Creates a random Lanthanide card',
                },
            }

}

-- Lanthanum
SMODS.Consumable {
    key = "lanthanum",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 0, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 57, yes_is_no = false }},  
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Lanthanum',
                text = {
                    'Adds +20 mult per composite numbered',
                    'card for the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 9 or context.other_card:get_id() == 10 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

-- Cerium
SMODS.Consumable {
    key = "cerium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 1, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 58, yes_is_no = false }},  
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Cerium',
                text = {
                    'Adds +20 mult per odd card for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9 or context.other_card:get_id() == 14 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end    
    end
end
}

-- Praseodymium
SMODS.Consumable {
    key = "praseodymium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 2, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 59, yes_is_no = false }},  
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Praseodymium',
                text = {
                    'Adds +20 mult per card with 5 letters for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 or context.other_card:get_id() == 7 or context.other_card:get_id() == 8 or context.other_card:get_id() == 12 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end    
    end
end
}

-- Neodymium
SMODS.Consumable {
    key = "neodymium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 3, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 60, yes_is_no = false }},  
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Neodymium',
                text = {
                    'Adds +20 mult per high card for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() >= 10 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end    
    end
end
}

-- Promethium
SMODS.Consumable {
    key = "promethium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 4, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 61, yes_is_no = false, odds = 12 }}, 
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_promethium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Promethium',
                text = {
                    'Adds +20 mult per average card for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() > 5 and context.other_card:get_id() < 10 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    if context.individual and context.cardarea == G.play then    
         if SMODS.pseudorandom_probability(card, 'c_xiferp_promethium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_samarium' })
        end    
    end
end
end
}

-- Samarium
SMODS.Consumable {
    key = "samarium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 5, y = 7 },
    unlocked = true,
    discovered = true,   
    config = { extra = { element_no = 62, yes_is_no = false, suit = 'Spades' } },
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Samarium',
                text = {
                    'Adds +20 mult per Spade for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

-- Europium
SMODS.Consumable {
    key = "europium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 6, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 63, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Europium',
                text = {
                    'Adds +20 mult per card with 4 letters for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 4 or context.other_card:get_id() == 5 or context.other_card:get_id() == 9 or context.other_card:get_id() == 11 or context.other_card:get_id() == 13 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end    
    end
end
}

-- Gadolinium
SMODS.Consumable {
    key = "gadolinium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 7, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 64, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Gadolinium',
                text = {
                    'Adds +20 mult per face card',
                    'for the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

-- Terbium
SMODS.Consumable {
    key = "terbium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 8, y = 7 },
    unlocked = true,
    discovered = true,   
    config = { extra = { element_no = 65, yes_is_no = false, suit = 'Clubs' } },
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Terbium',
                text = {
                    'Adds +20 mult per Club for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

-- Dysprosium
SMODS.Consumable {
    key = "dysprosium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 9, y = 7 },
    unlocked = true,
    discovered = true,   
    config = { extra = { element_no = 66, yes_is_no = false, suit = 'Diamonds' } },
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Dysprosium',
                text = {
                    'Adds +20 mult per Diamond for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

-- Holmium
SMODS.Consumable {
    key = "holmium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 10, y = 7 },
    unlocked = true,
    discovered = true,   
    config = { extra = { element_no = 67, yes_is_no = false, suit = 'Hearts' } },
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Holmium',
                text = {
                    'Adds +20 mult per Heart for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

-- Erbium
SMODS.Consumable {
    key = "erbium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 11, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 68, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Erbium',
                text = {
                    'Adds +20 mult per card with 3 letters',
                    'for the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or context.other_card:get_id() == 6 or context.other_card:get_id() == 10 or context.other_card:get_id() == 14 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

-- Thulium
SMODS.Consumable {
    key = "thulium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 12, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 69, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Thulium',
                text = {
                    'Adds +20 mult per low card for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() <= 5 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end    
    end
end
}

-- Ytterbium
SMODS.Consumable {
    key = "ytterbium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 13, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 70, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Ytterbium',
                text = {
                    'Adds +20 mult per even card for',
                    'the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end    
    end
end
}

-- Lutetium
SMODS.Consumable {
    key = "lutetium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 7 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 71, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Lutetium',
                text = {
                    'Adds +20 mult per prime numbered',
                    'card for the hand after this is used',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 14 then
          	     G.GAME.xiferp_lanthanide_mult = (G.GAME.xiferp_lanthanide_mult or 0) + 20
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    end
end
}

--(for Didymium only, which just buffs queens and has no design yet) in_pool = function(self, args) return args.source ~= 'sho' end   

-- Hafnium
SMODS.Consumable {
    key = "hafnium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 1, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 72 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal2_mult = (G.GAME.xiferp_tmetal2_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Hafnium',
                text = {
                    'Adds +20 mult per 3 for',
                    'the hand after this is used',
                },
            },
        
}

-- Tantalum
SMODS.Consumable {
    key = "tantalum",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 2, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 73 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal3_mult = (G.GAME.xiferp_tmetal3_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Tantalum',
                text = {
                    'Adds +20 mult per 4 for',
                    'the hand after this is used',
                },
            },
}

-- Tungsten
SMODS.Consumable {
    key = "tungsten",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 3, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 74 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal4_mult = (G.GAME.xiferp_tmetal4_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Tungsten',
                text = {
                    'Adds +20 mult per 5 for',
                    'the hand after this is used',
                },
            },
}

-- Rhenium
SMODS.Consumable {
    key = "rhenium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 4, y = 5 },
    unlocked = true,
     discovered = true,
    config = { extra = { element_no = 75 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal5_mult = (G.GAME.xiferp_tmetal5_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Rhenium',
                text = {
                    'Adds +20 mult per 6 for',
                    'the hand after this is used',
                },
            },
        
}

-- Osmium
SMODS.Consumable {
    key = "osmium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 5, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 76 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal6_mult = (G.GAME.xiferp_tmetal6_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Osmium',
                text = {
                    'Adds +20 mult per 7 for',
                    'the hand after this is used',
                },
            },
}

-- Iridium
SMODS.Consumable {
    key = "iridium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 6, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 77 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal7_mult = (G.GAME.xiferp_tmetal7_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Iridium',
                text = {
                    'Adds +20 mult per 8 for',
                    'the hand after this is used',
                },
            },
}

-- Platinum
SMODS.Consumable {
    key = "platinum",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 7, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 78 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal8_mult = (G.GAME.xiferp_tmetal8_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Platinum',
                text = {
                    'Adds +20 mult per 9 for',
                    'the hand after this is used',
                },
            },
}

-- Gold
SMODS.Consumable {
    key = "gold",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 8, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 79 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal9_mult = (G.GAME.xiferp_tmetal9_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Gold',
                text = {
                    'Adds +20 mult per 10 for',
                    'the hand after this is used',
                },
            },
}

-- Mercury
SMODS.Consumable {
    key = "e_mercury",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 9, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 80 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal10_mult = (G.GAME.xiferp_tmetal10_mult or 0) + 20
    end,
    loc_txt = {
        name = 'Mercury (Element)',
                text = {
                    'Adds +20 mult per Ace for',
                    'the hand after this is used',
                },
            },
}

-- Thallium
SMODS.Consumable {
    key = "thallium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 10, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 81 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_metal_mult = (G.GAME.xiferp_metal_mult or 0) + 3
    end,
    loc_txt = {
        name = 'Thallium',
                text = {
                    'Adds +3 mult per Jack for',
                    'the hand after this is used',
                },
            },

		
}

-- Lead
SMODS.Consumable {
    key = "lead",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 11, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 82 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_metal_mult = (G.GAME.xiferp_metal_mult or 0) + 4
    end,
    loc_txt = {
        name = 'Lead',
                text = {
                    'Adds +4 mult per Jack for',
                    'the hand after this is used',
                },
            },

		
}

-- Bismuth
SMODS.Consumable {
    key = "bismuth",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 12, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 83 }},
    can_use = function(self, card)
      return true
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_metal_mult = (G.GAME.xiferp_metal_mult or 0) + 5
    end,
    loc_txt = {
        name = 'Bismuth',
                text = {
                    'Adds +5 mult per Jack for',
                    'the hand after this is used',
                },
            },

		
}

-- Polonium
SMODS.Consumable {
    key = "polonium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 13, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 84, odds = 21 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_polonium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area, copier)
    	G.GAME.xiferp_metal_mult = (G.GAME.xiferp_metal_mult or 0) + 6
    end,
    loc_txt = {
        name = 'Polonium',
                text = {
                    'Adds +6 mult per Jack for',
                    'the hand after this is used',
                    '(1/21 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_polonium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_lead' })
        end
    end
end
}

-- Astatine
SMODS.Consumable {
    key = "astatine",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 85, odds = 3 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'c_xiferp_astatine')
        return { vars = { numerator, denominator } }
    end,    
    loc_txt = {
        name = 'Astatine',
                text = {
                    'Destroys 1 random card in hand and',
                    'adds +20 mult per Queen in your next hand.',
                    '(2/3 chance to radioactively decay)',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_smetal_mult = (G.GAME.xiferp_smetal_mult or 0) + 20           
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        SMODS.destroy_cards(card_to_destroy)
    end,      
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_astatine', 2, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_bismuth' })
        end
    end
end
}

-- Radon
SMODS.Consumable {
    key = "radon",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 15, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 86, odds = 2 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_radon')
        return { vars = { numerator, denominator } }
    end,    
    loc_txt = {
        name = 'Radon',
                text = {
                    'Adds +20 mult to your next hand.',
                    '(1/2 chance to radioactively decay)',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_nobelgas_mult = (G.GAME.xiferp_nobelgas_mult or 0) + 20            
    end,    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_radon', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_polonium' })
        end
    end
end
}

-- Francium
SMODS.Consumable {
    key = "francium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 16, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 87, odds = 4 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_francium')
        return { vars = { numerator, denominator } }
    end, 
    use = function(self, card, area, copier)
    	G.GAME.xiferp_alkimetal_mult = (G.GAME.xiferp_alkimetal_mult or 0) + 20 
          local alki_card = SMODS.add_card { set = "Base" }
          G.GAME.blind:debuff_card(alki_card)
          G.hand:sort()
          SMODS.calculate_context({ playing_card_added = true, cards = { alki_card } })
    end,
    loc_txt = {
        name = 'Francium',
                text = {
                    'Adds +20 mult for the hand',
                    'after this is used, and adds one',
                    'new card to the deck',
                    '(3/4 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_francium', 3, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_astatine' })
        end
    end
end
}

-- Radium
SMODS.Consumable {
    key = "radium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 17, y = 5 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 88, odds = 32 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_radium')
        return { vars = { numerator, denominator } }
    end,     
    loc_txt = {
        name = 'Radium',
                text = {
                    'Gives 1 random card radioactivity',
                    'and adds +20 mult to your next hand.',
                    '(1/32 chance to radioactively decay)',
                },
            },
    use = function(self, card, area, copier)
        G.GAME.xiferp_alkemetal_mult = (G.GAME.xiferp_alkemetal_mult or 0) + 10
        local card_to_stick = pseudorandom_element(G.hand.cards, 'random_radio')
        card_to_stick:add_sticker('xiferp_radi', true)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_radium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_radon' })
        end
    end
end
}

-- Actinium
SMODS.Consumable {
    key = "actinium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 0, y = 6 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 89, odds = 12 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_actinium')
        return { vars = { numerator, denominator } }
    end, 
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal1_xmult = (G.GAME.xiferp_tmetal1_xmult or 0) + 5
    end,
    loc_txt = {
        name = 'Actinium',
                text = {
                    'Adds x5 mult per 2 for',
                    'the hand after this is used',
                    '(1/12 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_actinium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_francium' })
        end
    end
end
}

-- Protactinium
SMODS.Consumable {
    key = "protactinium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 1, y = 6 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 90, odds = 43 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_protactinium')
        return { vars = { numerator, denominator } }
    end, 
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal3_xmult = (G.GAME.xiferp_tmetal3_xmult or 0) + 5
    end,
    loc_txt = {
        name = 'Protactinium',
                text = {
                    'Adds x5 mult per 4 for',
                    'the hand after this is used',
                    '(1/43 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_protactinium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_actinium' })
        end
    end
end
}

-- Thorium
SMODS.Consumable {
    key = "thorium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 2, y = 6 },
    unlocked = true,
    discovered = true,
    config = { extra = { element_no = 91, odds = 101 }},
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_thorium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal2_xmult = (G.GAME.xiferp_tmetal2_xmult or 0) + 5
    end,
    loc_txt = {
        name = 'Thorium',
                text = {
                    'x5 mult per 3 for the',
                    'hand after this is used',
                    '(1/101 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_thorium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_radium' })
        end
    end
end
}

-- Uranium
SMODS.Consumable {
    key = "uranium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 3, y = 6 },
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
      return true
    end,
    config = { extra = { element_no = 92, odds = 94 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_uranium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal4_xmult = (G.GAME.xiferp_tmetal4_xmult or 0) + 5
    end,
    loc_txt = {
        name = 'Uranium',
                text = {
                    'x5 mult per 5 for the',
                    'hand after this is used',
                    '(1/94 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_uranium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_thorium' })
        end
    end
end
}

-- Neptunium
SMODS.Consumable {
    key = "neptunium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 4, y = 6 },
    unlocked = true,
    discovered = false,
    can_use = function(self, card)   
        return true
    end,
    config = { extra = { element_no = 93, odds = 62 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_neptunium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_transuranium_xmult = (G.GAME.xiferp_transuranium_xmult or 0) + 5
    end,
    loc_txt = {
        name = 'Neptunium',
                text = {
                    'x5 mult per average card for the',
                    'hand after this is used',
                    '(1/62 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_neptunium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_protactinium' })
        end    
    end
end
}

-- Plutonium
SMODS.Consumable {
    key = "plutonium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 5, y = 6 },
    unlocked = true,
    discovered = false,
    can_use = function(self, card)   
        return true
    end,
    config = { extra = { element_no = 94, odds = 78 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_plutonium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_demoncore_xmult = (G.GAME.xiferp_demoncore_xmult or 0) + 5
    end,
    loc_txt = {
        name = 'Plutonium',
                text = {
                    'x5 mult per four-letter card for the',
                    'hand after this is used',
                    '(1/78 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_plutonium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_uranium' })
        end  
    end      
end
}

-- Astrogen
SMODS.Consumable {
    key = "astrogenium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 6, y = 6 },
    unlocked = true,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    can_use = function(self, card)   
        return true
    end,
    config = { extra = { element_no = 95, odds = 37 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_astrogenium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
             G.GAME.xiferp_futurecat_xmult = (G.GAME.xiferp_futurecat_xmult or 0) + 5
    end,
    loc_txt = {
        name = 'Astrogen',
                text = {
                    'x5 mult per Spade card for the',
                    'hand after this is used',
                    '(1/37 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_astrogenium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_neptunium' })
        end  
    end      
end
}


-- Curium
SMODS.Consumable {
    key = "curium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 7, y = 6 },
    unlocked = true,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,  
    can_use = function(self, card)
      return true
    end,
    config = { extra = { element_no = 96, odds = 72 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_curium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
        local card_to_stick = pseudorandom_element(G.hand.cards, 'random_radio')
        card_to_stick:add_sticker('xiferp_radi', true)
    end,
    loc_txt = {
        name = 'Curium',
                text = {
                    'x5 mult for the hand after this is used',
                    'and makes one random card radioactive',
                    '(1/72 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_curium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_plutonium' })
        end
    end
end
}

-- Szymiium
SMODS.Consumable {
    key = "szymiium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 8, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    can_use = function(self, card)   
        return true
    end,
    config = { extra = { element_no = 97, odds = 31 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_szymiium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	     G.GAME.xiferp_soupcan_xmult = (G.GAME.xiferp_soupcan_xmult or 0) + 5
    end, 
    loc_txt = {
        name = 'Szymiium',
                text = {
                    'x5 mult per random suit for the',
                    'hand after this is used',
                    '(1/31 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_szymiium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_astrogenium' })
        end    
    end
end
}

-- Dawgium
SMODS.Consumable {
    key = "dawgium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 9, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    config = { extra = { element_no = 98, odds = 29, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_dawgium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
        card.ability.extra.yes_is_no = true  
    end,   
     loc_txt = {
        name = 'Dawgium',
                text = {
                    'Adds x5 mult for your next scored card.',
                    '(1/29 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[#context.scoring_hand] then
          	     G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
                 SMODS.destroy_cards(card, nil, nil, true)
             end
        end
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_dawgium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_curium' })
        end    
    end
end
}

-- Comykelium
SMODS.Consumable {
    key = "comykelium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 10, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    config = { extra = { element_no = 99, odds = 11, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_comykelium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,    
     loc_txt = {
        name = 'Comykelium',
                text = {
                    'Adds x5 mult to your next hand',
                    'and destroys all held cards',
                    '(1/11 chance to radioactively decay and kill a held card)',
                },
            },
    calculate = function(self, card, context)
    if card.ability.extra.yes_is_no == true then
        if context.individual and context.other_card == context.scoring_hand[#context.scoring_hand] then
          	     G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
                 SMODS.destroy_cards(G.hand.cards)
                 SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_comykelium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_szymiium' })
            if #G.hand.cards > 0 then
                local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
                SMODS.destroy_cards(card_to_destroy)
            end
        end    
    end
end
}

-- Joshuanium
SMODS.Consumable {
    key = "joshuanium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 11, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    can_use = function(self, card)   
        return true
    end,
    config = { extra = { element_no = 100, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_joshuanium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
             G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
    	     G.GAME.xiferp_fermiisfermi_xmult = (G.GAME.xiferp_fermiisfermi_xmult or 0) + 5
        end,
    loc_txt = {
        name = 'Joshuanium',
                text = {
                    'x5 mult per random rank for the',
                    'hand after this is used',
                    '(1/4 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_joshuanium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_dawgium' })
        end  
    end      
end
}

-- Coronium
SMODS.Consumable {
    key = "coronium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 12, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    config = { extra = { element_no = 101, odds = 2, yes_is_no = false }},  
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,   
     loc_txt = {
        name = 'Coronium',
                text = {
                    'x5 mult for the hand after this is used',
                    'and splits one joker into two of a lesser rarity.',
		    '(must have room, 1/2 chance to randomly decay)',
                },
            },
    calculate = function(self, card, context)
     	if card.ability.extra.yes_is_no == true then
           if context.individual and context.cardarea == G.play then
            G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
            local destructable_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and not G.jokers.cards[i].getting_sliced then
                    destructable_jokers[#destructable_jokers + 1] =
                        G.jokers.cards[i]
                end
            end
            local joker_to_destroy = pseudorandom_element(destructable_jokers, 'coronium_poisoning')
            if joker_to_destroy then
                      SMODS.add_card { set = "Joker", rarity = 1 }
                      SMODS.add_card { set = "Joker", rarity = 1 }
                joker_to_destroy.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
            end
        end
        end
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_coronium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_comykelium' })
        end
    end
end
}

-- Mendeleevium
SMODS.Consumable {
    key = "mendeleevium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 13, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    can_use = function(self, card)
      return true
    end,
    config = { extra = { element_no = 102, odds = 3 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_xiferp_mendeleevium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                        SMODS.add_card({ key = pseudorandom_element({ 'c_xiferp_scandium', 'c_xiferp_gallium', 'c_xiferp_germanium', 'c_xiferp_technetium', 'c_xiferp_hafnium', 'c_xiferp_rhenium', 'c_xiferp_polonium', 'c_xiferp_astatine', 'c_xiferp_francium', 'c_xiferp_radium', 'c_xiferp_actinium', 'c_xiferp_protactinium' }, 'Prediction_Order'  )} )
                    return true
                end
            })) 
    end,
    loc_txt = {
        name = 'Mendeleevium',
                text = {
                    'x5 mult for the hand after this is used',
                    'and makes a predicted element card.',
                    '(1/3 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_mendeleevium', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_joshuanium' })
        end
    end
end
}

-- Flynnine
SMODS.Consumable {
    key = "flynnine",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 14, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,  
    config = { extra = { element_no = 103, odds = 3, yes_is_no = false }},
    keep_on_use = function(self, card)
       return true
    end,
    can_use = function(self, card)   
      if card.ability.extra.yes_is_no == false then
        return true
      end
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'c_xiferp_flynnine')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
       card.ability.extra.yes_is_no = true
    end,    
     loc_txt = {
        name = 'Flynnine',
                text = {
                    'Adds x5 mult to your next hand',
                    'and enhances all held cards',
                    '(2/3 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
            if card.ability.extra.yes_is_no == true then
          	     G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
                 SMODS.destroy_cards(card, nil, nil, true)
                 for _, card in ipairs(G.hand.cards) do
                    local xiferp_up_another_step = SMODS.poll_enhancement({guaranteed = true, type_key = 'shuffletheseed'})
                    card:set_ability(xiferp_up_another_step, nil, true)   
                 end
            end
        end
    if context.individual and context.cardarea == G.play then
         if SMODS.pseudorandom_probability(card, 'c_xiferp_flynnine', 2, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_coronium' })
        end    
    end
end
}

-- Freakon
SMODS.Consumable {
    key = "freakon",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 15, y = 6 },
    unlocked = true,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,  
    can_use = function(self, card)
      return true
    end,
    config = { extra = { element_no = 104, odds = 5 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 3, card.ability.extra.odds, 'c_xiferp_freakon')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_tmetal1_xmult = (G.GAME.xiferp_tmetal1_xmult or 1) + 5
        for _, card in ipairs(G.jokers.cards) do
             card.T.h = card.T.h * 0.7
        end
    end,
    loc_txt = {
        name = 'Freakon',
                text = {
                    'x5 mult for every 2 in the hand after',
                    'this card is used, and sets the height of',
                    'all held jokers to Wee Joker height.',
                    '(3/5 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_freakon', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_mendeleevium' })
        end
    end
end
}

-- Bananium
SMODS.Consumable {
    key = "bananium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 16, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    can_use = function(self, card)
      return true
    end,
    config = { extra = { element_no = 105, odds = 3 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'c_xiferp_bananium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                        SMODS.add_card({ key = pseudorandom_element({'j_gros_michel', 'j_cavendish' }, 'do_you_see_banana_man'  )} )
                    return true
                end
            })) 
    end,
    loc_txt = {
        name = 'Bananium',
                text = {
                    'x5 mult for the hand after this is used',
                    'and makes one banana joker.',
                    '(2/3 chance to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_bananium', 2, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_flynnine' })
        end
    end
end
}

-- Aikoyorium
SMODS.Consumable {
    key = "aikoyorium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 17, y = 6 },
    unlocked = false,
    discovered = false,
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    config = { extra = { odds = 5, element_no = 106 }},
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,  
    can_use = function(self, card)
      return true
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 4, card.ability.extra.odds, 'c_xiferp_aikoyorium')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area)
    	G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 0) + 5
        local card_to_stick = pseudorandom_element(G.hand.cards, 'random_alphabet')
        card_to_stick:set_seal('xiferp_letter')
    end,
    loc_txt = {
        name = 'Aikoyorium',
                text = {
                    'x5 mult for the hand after this is used',
                    'and gives one random card a Letter Seal.',
                    '(4/5 change to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'c_xiferp_aikoyorium', 4, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_freakon' })
        end
    end
end
}

-- Bolognium
SMODS.Consumable {
    key = "bolognium",
    set = "xiferp_Element",
    atlas = "Golden_Brick_Road",
    cost = 3,
    pos = { x = 1, y = 1 },
    unlocked = true,
    discovered = false,
    config = { extra = { element_no = 295 }},
    in_pool = function(self, args)
        return args.source ~= 'sho' 
    end,
    can_use = function(self, card)
      return true
    end,      
    use = function(self, card, area)
    	G.GAME.xiferp_lineseven_xmult = (G.GAME.xiferp_lineseven_xmult or 1) + 40
    end,
    loc_txt = {
        name = 'Bolognium',
                text = {
                    'x40 mult for the hand after this is used.',
                    '(guaranteed to radioactively decay)',
                },
            },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.add_card({ key = 'c_xiferp_praseodymium' })
                SMODS.add_card({ key = 'c_xiferp_praseodymium' })
        end
    end
}


SMODS.current_mod.calculate = function(self, context)
    local random_id = pseudorandom('numerical_shish', 2, 14)
    local spadesuit = 'Spades'
    local random_suit = pseudorandom_element({ 'Spades', 'Diamonds', 'Clubs', 'Hearts' }, 'wearable_shish' )
         if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
            if (G.GAME.xiferp_flike_chips or 0) > 0 then
      		local give_chips = G.GAME.xiferp_flike_chips or 0
       		 return { chips = give_chips }
	        end            
            if (G.GAME.xiferp_flike_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_flike_mult or 0
       		 return { mult = give_mult }
	        end
            if (G.GAME.xiferp_nobelgas_chips or 0) > 0 then
      		local give_chips = G.GAME.xiferp_nobelgas_chips or 0
       		 return { chips = give_chips }
	        end
            if (G.GAME.xiferp_nobelgas_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_nobelgas_mult or 0
       		 return { mult = give_mult }
	        end
            if (G.GAME.xiferp_alkimetal_chips or 0) > 0 then
      		local give_chips = G.GAME.xiferp_alkimetal_chips or 0
       		 return { chips = give_chips }
	        end            
            if (G.GAME.xiferp_alkimetal_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_alkimetal_mult or 0
       		 return { mult = give_mult }
	        end
            if (G.GAME.xiferp_alkemetal_chips or 0) > 0 then
      		local give_chips = G.GAME.xiferp_alkemetal_chips or 0
       		 return { chips = give_chips }
	        end
            if (G.GAME.xiferp_alkemetal_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_alkemetal_mult or 0
       		 return { mult = give_mult }
	       end
            if (G.GAME.xiferp_lineseven_xmult or 0) > 0 then
      		local give_xmult = G.GAME.xiferp_lineseven_xmult or 0
       		 return { xmult = give_xmult }
	       end
         end
    	 if context.individual and context.cardarea == G.play and context.other_card:get_id() == 11 then
            if (G.GAME.xiferp_metal_chips or 0) > 0 then
      		local give_chips = G.GAME.xiferp_metal_chips or 0
       		 return { chips = give_chips }
	        end
            if (G.GAME.xiferp_metal_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_metal_mult or 0
       		 return { mult = give_mult }
	       end
         end
    	 if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
            if (G.GAME.xiferp_smetal_chips or 0) > 0 then
      		local give_chips = G.GAME.xiferp_smetal_chips or 0
       		 return { chips = give_chips }
	        end
            if (G.GAME.xiferp_smetal_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_smetal_mult or 0
       		 return { mult = give_mult }
	       end
         end
    	 if context.individual and context.cardarea == G.play and context.other_card:get_id() == 13 then
            if (G.GAME.xiferp_nmetal_chips or 0) > 0 then
      		local give_chips = G.GAME.xiferp_nmetal_chips or 0
       		 return { chips = give_chips }
	        end
            if (G.GAME.xiferp_nmetal_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_nmetal_mult or 0
       		 return { mult = give_mult }
	       end
         end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 then
            if (G.GAME.xiferp_tmetal1_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal1_mult or 0
       		 return { mult = give_mult }
	       end
            if (G.GAME.xiferp_tmetal1_xmult or 0) > 0 then
      		local give_xmult = G.GAME.xiferp_tmetal1_xmult or 0
       		 return { xmult = give_xmult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 3 then
            if (G.GAME.xiferp_tmetal2_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal2_mult or 0
       		 return { mult = give_mult }
	       end
            if (G.GAME.xiferp_tmetal2_xmult or 0) > 0 then
      		local give_xmult = G.GAME.xiferp_tmetal2_xmult or 0
       		 return { xmult = give_xmult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 4 then
            if (G.GAME.xiferp_tmetal3_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal3_mult or 0
       		 return { mult = give_mult }
	       end
            if (G.GAME.xiferp_tmetal3_xmult or 0) > 0 then
      		local give_xmult = G.GAME.xiferp_tmetal3_xmult or 0
       		 return { xmult = give_xmult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 5 then
            if (G.GAME.xiferp_tmetal4_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal4_mult or 0
       		 return { mult = give_mult }
	       end
            if (G.GAME.xiferp_tmetal4_xmult or 0) > 0 then
      		local give_xmult = G.GAME.xiferp_tmetal4_xmult or 0
       		 return { xmult = give_xmult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
            if (G.GAME.xiferp_tmetal5_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal5_mult or 0
       		 return { mult = give_mult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 7 then
            if (G.GAME.xiferp_tmetal6_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal6_mult or 0
       		 return { mult = give_mult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 8 then
            if (G.GAME.xiferp_tmetal7_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal7_mult or 0
       		 return { mult = give_mult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 9 then
            if (G.GAME.xiferp_tmetal8_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal8_mult or 0
       		 return { mult = give_mult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 then
            if (G.GAME.xiferp_tmetal9_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal9_mult or 0
       		 return { mult = give_mult }
	       end

      end
          if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            if (G.GAME.xiferp_tmetal10_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_tmetal10_mult or 0
       		 return { mult = give_mult }
	       end

      end
         if context.individual and context.cardarea == G.play then
            if (G.GAME.xiferp_lanthanide_mult or 0) > 0 then
      		local give_mult = G.GAME.xiferp_lanthanide_mult or 0
       		 return { mult = give_mult }
	       end
      end
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() > 5 and context.other_card:get_id() < 10 then
                if (G.GAME.xiferp_transuranium_xmult or 0) > 0 then
      		    local give_xmult = G.GAME.xiferp_transuranium_xmult or 0
       		    return { xmult = give_xmult }
	       end
        end
      end
         if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 4 or context.other_card:get_id() == 5 or context.other_card:get_id() == 9 or context.other_card:get_id() == 11 or context.other_card:get_id() == 13 then
                if (G.GAME.xiferp_demoncore_xmult or 0) > 0 then
      		    local give_xmult = G.GAME.xiferp_demoncore_xmult or 0
       		    return { xmult = give_xmult }
	       end
        end
      end
         if context.individual and context.cardarea == G.play and context.other_card:is_suit(spadesuit) then
                if (G.GAME.xiferp_futurecat_xmult or 0) > 0 then
      		    local give_xmult = G.GAME.xiferp_futurecat_xmult or 0
       		    return { xmult = give_xmult }
	       end
      end
         if context.individual and context.cardarea == G.play and context.other_card:get_id() == random_id then
                if (G.GAME.xiferp_fermiisfermi_xmult or 0) > 0 then
      		    local give_xmult = G.GAME.xiferp_fermiisfermi_xmult or 0
       		    return { xmult = give_xmult }
	       end
      end
         if context.individual and context.cardarea == G.play and context.other_card:is_suit(random_suit) then
                if (G.GAME.xiferp_soupcan_xmult or 0) > 0 then
      		    local give_xmult = G.GAME.xiferp_soupcan_xmult or 0
       		    return { xmult = give_xmult }
	       end
      end
      if context.after then
         G.GAME.xiferp_flike_chips = 0
         G.GAME.xiferp_flike_mult = 0
         G.GAME.xiferp_alkimetal_chips = 0
         G.GAME.xiferp_alkimetal_mult = 0
         G.GAME.xiferp_alkemetal_chips = 0
         G.GAME.xiferp_alkemetal_mult = 0
         G.GAME.xiferp_nobelgas_chips = 0
         G.GAME.xiferp_nobelgas_mult = 0
         G.GAME.xiferp_metal_chips = 0
         G.GAME.xiferp_metal_mult = 0
         G.GAME.xiferp_smetal_chips = 0
         G.GAME.xiferp_smetal_mult = 0
         G.GAME.xiferp_nmetal_chips = 0
         G.GAME.xiferp_nmetal_mult = 0
         G.GAME.xiferp_tmetal1_mult = 0
         G.GAME.xiferp_tmetal2_mult = 0
         G.GAME.xiferp_tmetal3_mult = 0
         G.GAME.xiferp_tmetal4_mult = 0
         G.GAME.xiferp_tmetal5_mult = 0
         G.GAME.xiferp_tmetal6_mult = 0
         G.GAME.xiferp_tmetal7_mult = 0
         G.GAME.xiferp_tmetal8_mult = 0
         G.GAME.xiferp_tmetal9_mult = 0
         G.GAME.xiferp_tmetal10_mult = 0
         G.GAME.xiferp_lanthanide_mult = 0
         G.GAME.xiferp_tmetal1_xmult = 0
         G.GAME.xiferp_tmetal2_xmult = 0
         G.GAME.xiferp_tmetal3_xmult = 0
         G.GAME.xiferp_tmetal4_xmult = 0
         G.GAME.xiferp_lineseven_xmult = 0
         G.GAME.xiferp_transuranium_xmult = 0
         G.GAME.xiferp_demoncore_xmult = 0
         G.GAME.xiferp_futurecat_xmult = 0
         G.GAME.xiferp_fermiisfermi_xmult = 0
         G.GAME.xiferp_soupcan_xmult = 0
      end
end