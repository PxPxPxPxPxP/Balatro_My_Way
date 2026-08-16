return {
    descriptions = {
        Enhanced = {
            m_xiferp_road = {
                name = "Paved Road Card",
                text = {
                    "{X:mult,C:white} X3 {} Mult",
		    "when played as part of a Straight,",
                    "#1#/#2# chance to develop Potholes.",
                },
            },
            m_xiferp_pothole = {
                name = "Potholed Road Card",
                text = {
                    "{X:mult,C:white} X2 {} Mult for <5 cards,",
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
                    "Turns every other joker into Joker,",
		    "gives {X:mult,C:white} X4 {} Mult per each.",
		    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)",
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
		    "{C:mult}-1{} mult per blind beaten",
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
		    "{C:inactive}(Recoded by nh6574)",
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
            j_xiferp_kameron = {
                name = 'KamSandwich',
                text = {
                    "{C:red}+19.#3#{}-{C:red}19.#4#{} Mult",
		            "{C:inactive}#1#",
		            "{C:inactive}#2#",
                },
             
         },
            j_xiferp_battery = {
                name = 'Battery',
                text = {
                    "Gives each played card a random enhancement",
		            "{C:inactive} But only so many.",
		            "{C:inactive} (#1#%)",
                },
             
         },
            j_xiferp_sweettea = {
                name = 'Tea',
                text = {
                    "{X:mult,C:white} x#1# {} Mult, {X:mult,C:white} x-#2# {} Mult each round.",
                },
         },
            j_xiferp_wordladder = {
                name = 'Word Ladder',
                text = {
                    "{C:red}+#2# Mult{}, {C:blue}+#1# chips{}",
		    "Both gain 2 each time a word is played.",
		    "{C:inactive} Balatro My Way does not have playable",
		    "{C:inactive} words by itself, so good luck.",
                },
         },
            j_xiferp_trashcan = {
                name = 'Trash Can',
                text = {
                    "{C:blue}+6{} Chips per joker deleted.",
                    "{C:inactive} (Currently {C:blue}#1#{} Chips)",
                },
         },
            j_xiferp_switch = {
                name = 'Score Switch',
                text = {
                    "Turns off scoring for every non-final hand",
                },
         },
            j_xiferp_science = {
                name = 'Elemental Scientist',
                text = {
                    "{C:red}+1{} Mult per Element Card used this run",
                    "{C:inactive} (Currently {C:red}+#1#{} {C:inactive}Mult)",
                },
         },
            j_xiferp_house = {
                name = 'House Of Cards',
                text = {
                    "{C:red}+1{} Mult per card played,",
                    "resets if {C:attention}#2# of #3#{} scores.",
		    "{C:inactive} (Currently {C:red}+#1#{} {C:inactive}Mult)",
                },
         },
            j_xiferp_jojostand = {
                name = 'Balatro But Really Really Fast',
                text = {
                    "{C:red}+4{} Mult",
                    "{C:inactive} per every deck alteration",
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
            xiferp_radi_seal = {
                name = "Radioactive",
                text = {
                    "{X:mult,C:white} X#1# {} Mult when played,",
                    "{C:green}#2# in #3#{} chance to radioactively decay",
                },
            },
            p_xiferp_mendeleev = {
                name = "Element Card Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:attention} Element{} cards to",
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
        Tarot = { 
            c_xiferp_page_coins = {
                name = 'Page of Coins',
                text = {
                    "Gives one more than the total",
                    "sell value of all current",
                    "Consumables {C:inactive}(Max of {C:money}$#1#{C:inactive})",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
                },
            },
            c_xiferp_page_cups = {
                name = "Page of Cups",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:spectral}Spectral{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
            c_xiferp_page_swords = {
                name = "Page of Swords",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:green}Element{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
            c_xiferp_page_wands = {
                name = "Page of Wands",
                text = {
                    "Unenhances {C:attention}#1#",
                    "enhanced card, makes its",
		    "corresponding {C:tarot}Tarot{}",
                    "{C:inactive}(Must have room)",
                },
            },
        },
    },
    misc = {
        dictionary = {
            b_xiferp_element_cards = "Element Cards",
            k_xiferp_element = "Element",
	    randomline1 = "If I spend any more time in here, I'm scared my soul",
	    randomline21 = "will be sucked out of my body and added to a card.",
	    randomline2 = "Yes! YES! THIS IS WHAT I'M TALING ABOUT! LOOK AT ALL THAT",
	    randomline22 = "CHEESE! This box could kill a lactose intolerant person.",
	    randomline3 = "I will say that it is very unlikely that I will ever be",
	    randomline23 = "able to win this game, [...], so yeah, I have no chance.",
	    randomline4 = "And remember kids, ANY PURCHASE IS A GOOD PURCHASE.",
	    randomline24 = "(this text sponsored by the Target Circle Red Card)",
	    randomline5 = "Ah, right rare find right there! Now, whenever one of these puppies approaches",
	    randomline25 = "you, show it a bit of kindness by tossing it a few scraps from your lunchbox.",
	    randomline6 = "You could feasibly experience everything this game",
	    randomline26 = "offers, and finish it, in less than five minutes!",
	    randomline7 = "The Campaign For North Africa, The Desert War, 1940-1943",
	    randomline27 = " ",
	    randomline8 = "And you know what? I'll absolutely take a game that's horribly unbalanced",
	    randomline28 = "on purpose before I take a game that does it on accident!",
	    randomline9 = "candyland",
	    randomline29 = " ",
	    randomline10 = "15love",
	    randomline30 = " ",
	    randomline11 = "breakey",
	    randomline31 = " ",
	    randomline12 = "oneupmanship",
	    randomline32 = " ",
	    randomline13 = "24thedvdboardgame",
	    randomline33 = " ",
        --"You aren't real. I know it might be tough to hear,",
        --"but if you really look at yourself, you do not exist.",
        --"You won't find a bigger hater of the Game of Life",
        --"out there than the CONFEDERATE STATES OF AMERICA.",
        --"Fans waited 100 years for a follow-up, and all they got",
        --"was a reboot. If they were alive, they'd be furious.",
	    randomline14 = " ",
	    randomline34 = " ",
	    randomline15 = "coup",
	    randomline35 = " ",
	    randomline16 = "You wanna know the worst part about all this nonsense? You can own this",
	    randomline36 = "veritable mystery product for the low, low price of $21! The nerve!",
	    randomline17 = "whatdoyoumeme",
	    randomline37 = " ",
	    randomline18 = "Here are the top ten reasons why roundabouts should be",
	    randomline38 = "outlawed! Number one: They are incredibly pretentious.",
	    randomline19 = "You cannot say “Give us Poland, we deserve Poland,” you lost! The cow dice rolled a",
	    randomline39 = "3, if we would've went with the other rolls you still would've lost Czechoslovakia!",
	    randomline20 = "I guess this is a good market indicator that I can start production on",
	    randomline40 = "the Chairman Mao anime card game- I did not just give them that idea.",
        },
        labels = {
            xiferp_element = "Element Card",
	        xiferp_letter_seal = "Letter Seal",
        },
    }
}

