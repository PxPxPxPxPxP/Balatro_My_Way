SMODS.Atlas {
	key = "futureteller",
	path = "248631795.png",
	px = 71,
	py = 95
}

--Page of Coins
SMODS.Consumable {
    key = 'page_coins',
    set = 'Tarot',
    atlas = 'futureteller',
    pos = { x = 0, y = 0 },
    config = { extra = { max = 20, money = 1 } },
    loc_vars = function(self, info_queue, card)
        local money = 0
        if G.consumeables then
            for i = 1, #G.consumeables.cards do
                money = money + G.consumeables.cards[i].sell_cost
            end
        end
        card.ability.extra.money = math.min(money, card.ability.extra.max)
        return { vars = { card.ability.extra.max, card.ability.extra.money } }
    end,
    use = function(self, card, area, copier)
        local money = 1
        for i = 1, #G.consumeables.cards do
            money = money + G.consumeables.cards[i].sell_cost
        end
        card.ability.extra.money = math.min(money, card.ability.extra.max)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.money, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}

-- Page of Cups
SMODS.Consumable {
    key = 'page_cups',
    set = 'Tarot',
    atlas = 'futureteller',
    pos = { x = 1, y = 0 },
    config = { extra = { spectrals = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.spectrals } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.spectrals, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Spectral', key_append = "cups" })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end
}


--Page of Swords
SMODS.Consumable {
    key = 'page_swords',
    set = 'Tarot',
    atlas = 'futureteller',
    pos = { x = 0, y = 1 },
    config = { extra = { element = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.element } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.element, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'xiferp_Element', key_append = "swords" })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end
}


-- Page Of Wands
SMODS.Consumable {
    key = 'page_wands',
    set = 'Tarot',
    atlas = 'futureteller',
    pos = { x = 1, y = 1 },
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for k, v in pairs(G.P_CENTERS) do
            if v.set == 'Tarot' and v.config and v.config.mod_conv == G.hand.highlighted[1].config.center.key then
                SMODS.add_card({key = v.key})
            end
        end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability("c_base", nil, false)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted and G.hand.highlighted[1].config.center.key ~= 'c_base'
    end
}