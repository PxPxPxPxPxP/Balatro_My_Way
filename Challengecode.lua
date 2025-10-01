-- Laundry Day
SMODS.Challenge {
  

    key = 'laundry_day_1',
    rules = {
        custom = {
            { id = 'laundry_day' }
        }
    },
    jokers = {
        { id = 'j_dna' }
    },
    restrictions = {
        banned_cards = {
            { id = 'j_greedy_joker' },
            { id = 'j_lusty_joker' },
            { id = 'j_wrathful_joker' },
            { id = 'j_gluttenous_joker' },
            { id = 'j_blackboard' },
            { id = 'j_seance' },
            { id = 'j_ancient' },
            { id = 'j_castle' },
            { id = 'j_certificate' },
            { id = 'j_marble' },
            { id = 'j_bloodstone' },
            { id = 'j_rough_gem' },
            { id = 'j_arrowhead' },
            { id = 'j_onyx_agate' },
            { id = 'j_flower_pot' },
            { id = 'j_seeing_double' },
            { id = 'j_crafty' },
            { id = 'j_devious' },
            { id = 'j_crazy' },
            { id = 'j_droll' },
            { id = 'j_order' },
            { id = 'j_tribe' },
            { id = 'j_runner' },
            { id = 'j_four_fingers' },
            { id = 'j_superposition' },
            { id = 'j_shortcut' },
            { id = 'j_smeared' },
            { id = 'c_star' },
            { id = 'c_moon' },
            { id = 'c_sun' },
            { id = 'c_world' },
            { id = 'c_sigil' },
            { id = 'c_incantation' },
            { id = 'c_grim' },
            { id = 'c_familiar' },
            { id = 'c_jupiter' },
            { id = 'c_saturn' },
            { id = 'c_neptune' },
            { id = 'c_ceres' },
            { id = 'c_eris' },
            { id = 'v_magic_trick' },
            { id = 'v_illusion' },
            { id = 'p_standard_normal_1', ids = {
                'p_standard_normal_1', 'p_standard_normal_2',
                'p_standard_normal_3', 'p_standard_normal_4',
                'p_standard_jumbo_1', 'p_standard_jumbo_2',
                'p_standard_mega_1', 'p_standard_mega_2' } },

        },

                banned_tags = {
            { id = 'tag_standard' }
        },
    
    banned_other = {
            { id = 'bl_club', type = 'blind' },
            { id = 'bl_goad', type = 'blind' },
            { id = 'bl_window', type = 'blind' },
            { id = 'bl_head', type = 'blind' },
      }
 },
     
    deck = {
        type = 'Challenge Deck',
        cards = {
            { s = 'H', r = 'A' }, 
            { s = 'H', r = 'K' },
            { s = 'H', r = 'Q' },
            { s = 'H', r = 'J' },
            { s = 'H', r = 'T' },
            { s = 'H', r = '9' },
            { s = 'H', r = '8' },
            { s = 'H', r = '7' },
            { s = 'H', r = '6' },
            { s = 'H', r = '5' },
            { s = 'H', r = '4' },
            { s = 'H', r = '3' },
            { s = 'H', r = '2' },
         }
     }
}