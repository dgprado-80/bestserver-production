local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local position = {x = 32349, y = 33483, z = 5}
    
    if item.itemid == 2772 then
        -- Remove o item na posição específica
        Tile(position):getItemById(2185):remove()
        -- Transforma a alavanca para o estado "puxado"
        item:transform(2773)
        
        -- Agenda o reset da alavanca após 10 minutos (600 segundos)
        addEvent(function()
            local leverItem = Item(item.uid)
            if leverItem and leverItem:getId() == 2773 then
                leverItem:transform(2772)
                Game.createItem(2185, 1, position)
            end
        end, 10 * 60 * 1000) -- 10 minutos em milissegundos

    elseif item.itemid == 2773 then
        -- Cria o item na posição específica
        Game.createItem(2185, 1, position)
        -- Transforma a alavanca para o estado "não puxado"
        item:transform(2772)
    end
    
    return true
end

lever:uid(42761)
lever:register()