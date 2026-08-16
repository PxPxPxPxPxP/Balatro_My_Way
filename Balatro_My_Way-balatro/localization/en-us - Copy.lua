return {
    descriptions = {
        Enhanced = {
            xiferp_road = {
                name = "Paved Road Card",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
		            "when played as part of a Straight,",
                    "1/#1# chance to develop Potholes.",
                },
            },
            xiferp_pothole = {
                name = "Potholed Road Card",
                text = {
                    "{X:mult,C:white} X#1# {} Mult for <5 cards,",
                    "including hands containing Straights.",
                },
            },
        },
        Joker = {
            j_xiferp_corrupted_dna = {
                name = 'Corrupted DNA',
                text = {
                    'Incorrectly copies the first scored card of a hand.',
                },
                
         },
            j_xiferp_top_to_bottom = {
                name = 'Top To Bottom',
                text = {
                    'Lets straights go over the Ace.',
                    '(example: Q, K, A, 2, 3)',
                },
                
         },
            j_xiferp_astro_card = {
                name = 'Out In Spades...',
                text = {
                    'At the end of a round, randomly turns one',
                    'card held in hand to a spade.',
                },
                
         },
 	        j_xiferp_scorigami = {
                name = 'Scorigami Card',
                text = {
                    'Gains {C:chips}+#1#{} chips if base chip total',
                    'in one hand is unique.',
		    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
                },
                
         },
	        j_xiferp_jphone = {
                name = 'Cell Phone',
                text = {
                    'Takes $6 and buys a random',
                    'Uncommon joker each blind.',
                },
                
         },
            j_xiferp_szymii = {
                name = 'Szymii',
                text = {
                    'Retriggers all cards of the second most common suit.',
                    '{C:inactive}(Buffs hearts if tied)',
                },
                
         },
            j_xiferp_pop_can = {
                name = 'Pop Can Joker',
                text = {
                    'Gives $4 if the first played card in a',
                    'hand is a Diamond.',
                },
                
         },
             j_xiferp_lhc = {
                name = 'Particle Accelerator',
                text = {
                    'When holding two element cards, smashes',
                    'them together into a heavier element card.',
                },
                
         },
             j_xiferp_sandwich = {
                name = 'Bologna Sandwich',
                text = {
                    '{C:red}+4{C:black} Mult if played',
                    'hand is made into a sandwich.',
                },
                
         },
             j_xiferp_breadclip = {
                name = 'Occlupanid',
                text = {
                    "Saves the first hand's score",
                    "and adds it to last hand's chips.",
                },
                
         },
             j_xiferp_chance_card = {
                name = 'Origami Fool',
                text = {
                    '-4 mult, +1 joker slot',
                },
                
         },
             j_xiferp_pex_card = {
                name = 'Eleven Words',
                text = {
                    "Multiplies it's own xmult by x1.1 each hand",
                    'Currently {X:mult,C:white} X#1# {} Mult',
                },
                
         },
            j_xiferp_index_card = {
                name = 'Index Card',
                text = {
                    "{C:red}+#1#{C:black} Mult, spawns an element card each hand.",
                },
                
         },          
            j_xiferp_ghostsalt = {
                name = 'Salted Ghost',
                text = {
                    "(Rare) If played hand contains an unscoring card, creates a Tarot card (Must have room)",
                },
                
         },      
            j_xiferp_daynan = {
                name = 'Dark Comedy',
                text = {
                    "(Leg.) Turns every other joker into Joker, and gives 4 xmult per each.",
                },
                
         },      
            j_xiferp_altohater = {
                name = 'Dawg :sob: :sob:',
                text = {
                    "(Uncommon) Lucky Cards earn $1 per succesful lucky card money trigger.",
                },
                
         },   
            j_xiferp_vending_machine = {
                name = 'Vending Machine',
                text = {
                    "Spawns one food joker when sold.",
                },
                
         },     
            j_xiferp_needle_deedle = {
                name = 'Joker Kebab',
                text = {
                    "(Uncommon) Gives +8 Mult when the Joker to the right triggers.",
                },
                
         },     
            j_xiferp_whiteboard = {
                name = 'Whiteboard',
                text = {
                    "(Uncommon) X3 Mult if all cards held in hand are Hearts or Diamonds.",
                },
                
         },     
            j_xiferp_radiocarbon = {
                name = 'Radiocarbon',
                text = {
                    "X14 mult, divided by 2 every round.",
		            "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
                
         },     
            j_xiferp_tf_poker = {
                name = 'Not, in fact, A Friend of Jimbo',
                text = {
                    "+1 Ace if none played this hand.",
                },
               
         },    
            j_xiferp_shattered = {
                name = 'Dropped Glass',
                text = {
                    "(Common) +2 mult per max number of glass cards in deck.",
                },
               
         },   
            j_xiferp_naturaltalent = {
                name = 'Nat-20',
                text = {
                    "(Uncommon) Triples all listed probabilities. (ex: 1 in 3 to 3 in 3)",
                },
               
         },   
            j_xiferp_challenge = {
                name = 'Challenge Joker',
                text = {
                    "(Uncommon) x3 mult, must win with high card (and such similar).",
                },
               
         },   
            j_xiferp_record = {
                name = 'Record Shop',
                text = {
                    "Creates a joker based on music when bought",
                },
               
         },   
            j_xiferp_timeszero = {
                name = 'My Hero Zero',
                text = {
                    "Does nothing...?",
                },
               
         },  
            j_xiferp_chocoins = {
                name = 'Chocolate Coins',
                text = {
                    "{C:mult}+1{} mult per dollar when bought,",
		    "{C:mult}-1{} mult per hand played",
		    "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)",
                },
               
         }, 
            j_xiferp_sudoku = {
                name = 'Joker Sudoker',
                text = {
                    "{X:mult,C:white} X9 {} Mult per nine 9's in your deck",
                },
               
         }, 
            j_xiferp_alphabet = {
                name = 'Alphabet Soup',
                text = {
                    "{X:mult,C:white} X#1# {} Mult, {X:mult,C:white} X#2# {} Mult per letter eaten",
                },
               
         }, 
            j_xiferp_altas = {
                name = 'United States Altas',
                text = {
                    "{C:blue}+50{} chips",
                },
               
         }, 
            j_xiferp_city_altas = {
                name = 'US City Altas',
                text = {
                    "{C:red}+5.7{} Mult",
                },
               
         }, 
            j_xiferp_inscryptid = {
                name = 'Inscryption Joker',
                text = {
                    "{C:red}+2{} Mult per each destroyed Joker.",
		    "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)",
                },
             
         },
        },
        Other = {
            xiferp_letter_seal = {  
            	name = "Letter Seal",
            	text = {
                    "Gives a certain amount of chips and mult per hand",
                    "{C:inactive} For 3 cards: 10 chips and 10 mult",
                    "{C:inactive} For 4 cards: 17 chips and 13 mult",
                    "{C:inactive} For 5 cards: 24 chips and 18 mult",
                },
            },
            p_xiferp_mendeleev = {
                name = "Element Card Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:attention} Playing{} cards to",
                    "add to your deck",
                },
            },
        },
        Planet = { 
            c_xiferp_moon = {
                name = 'Moon',
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
        },
    },
    misc = {
        dictionary = {
            b_xiferp_element = "Element Cards",
            k_xiferp_element = "Element",
        },
        labels = {
            xiferp_element = "Element Card",
	        xiferp_letter_seal = "Letter Seal",
        },
    }
}
