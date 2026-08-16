SMODS.PokerHand({
	key = "xiferp_royal_sampler",
	visible = false,
	chips = 25,
	mult = 4,
	l_chips = 10,
	l_mult = 2,
	loc_txt = {
        	name = "Royal Sampler",
        	description = { "An otherwise 5-card High Card", "With at least one face card." },
    	},
	example = {
		{ "S_T", true },
		{ "D_Q", true },
		{ "H_6", true },
		{ "C_K", true },
		{ "H_3", true },
	},
	evaluate = function(parts, hand)
       	if not next(parts._2) and not next(parts._3) and not next(parts._straight) and not next(parts._flush) then
		local cards = {}
		local facecards = {}
		for i, card in ipairs(hand) do
				cards[#cards + 1] = card
			if card:get_id() > 10 and card:get_id() < 14 then
				facecards[#facecards + 1] = card
			end
		if #cards >= 5 and #facecards >= 1 then
			return { cards }
			end
		end
	end	
end
})