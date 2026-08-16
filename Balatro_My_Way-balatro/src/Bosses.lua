SMODS.Atlas {
	key = "corporate_entity_overlord",
	path = "1472583690.png",    
    atlas_table = 'ANIMATION_ATLAS',
    frames = 1,
    fps = 1,
	px = 128,
	py = 128
}

local quiz_box = UIBox{
        definition = {
            n=G.UIT.ROOT, config={align="cm", padding = 0.05},nodes ={
                {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                        {n=G.UIT.T, config={text = "CAN YOU STILL REMEMBER?", scale = 0.25, color = G.C.WHITE, shadow = true}}
                    }},
                    {n=G.UIT.R, config={align = "cm", padding = 0.15}, nodes={
                        {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
                            UIBox_button{ label = {"Blue Red Blue Yellow"}, button = "disbuff", minw = 1.7, minh = 0.4, scale = 0.35},
                            UIBox_button{ label = {"Flush with a pair"}, button = "DT_lose_game", minw = 1.7, minh = 0.4, scale = 0.35},
                        }},
                        {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
                            UIBox_button{ label = {"Skip this question"}, button = "DT_lose_game", minw = 1.7, minh = 0.4, scale = 0.35},
                            UIBox_button{ label = {"Idk, like 400?"}, button = "DT_lose_game", minw = 1.7, minh = 0.4, scale = 0.35},
                        }}
                    }},
                }}
            }},
        }

G.FUNCS.disbuff = function()
    if G.GAME.blind and G.GAME.blind.name == "bl_xiferp_boss_splapp" then
        G.GAME.blind:disable()
        quiz_box = nil
    end
end

G.FUNCS.DT_lose_game = function() 
    if G.STAGE == G.STAGES.RUN then 
        G.STATE = G.STATES.GAME_OVER
        G.STATE_COMPLETE = false 
    end 
end

local quizLoad = function()
 G.splapp_config = G.splapp_config or {}

 return quiz_box
end

SMODS.Blind {
        key = "boss_splapp",
        pos = { y = 0 },
        dollars = 7,
        mult = 2,
        boss = { min = 1 },
        loc_txt = {
            name = "The Splapp",
            text = {
                "Answer an impossible question",
                "(Coded by Feli and Foo54)",
            }
        },
        boss_colour = HEX('cd9e12'),
        calculate = function(self, blind, context)
            if blind.disabled then return end
            if context.setting_blind then
                quizLoad()
            end
        end
    }