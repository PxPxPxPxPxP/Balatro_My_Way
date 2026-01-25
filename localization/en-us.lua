return {

     descriptions = {
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
                    'Makes a random Uncommon joker',
                    'inside of big blinds.',
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
                    '+4 mult if played hand is',
                    'made into a sandwich.',
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
    },

   },       
    misc = {   
        labels = {
            'xiferp_element' == "Element Card",
        },
        dictionary = {
            b_xiferp_element_cards = "Element Cards"
        }
    }
}

