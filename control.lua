local belts
local spawn_item = "iron-ore"
local chest_detection_rate = 50

remote.add_interface("spawnbelt", {
  setitem = function(item)
    global.spawn_item = item;
    spawn_item = global.spawn_item;
  end
})

script.on_load(function(event)
  if global.belts ~= nil then
    belts = global.belts;
    script.on_event(defines.events.on_tick, tick_belts);
  end
  if global.spawn_item ~= nil then
    spawn_item = global.spawn_item;
  end
end)

script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == "spawn-belt" 
  or event.created_entity.name == "void-belt" then
    initalize_globals();
    new_belt = {};
    new_belt["entity"] = event.created_entity;
    new_belt["item"] = spawn_item;
    new_belt["chest"] = nil;
    table.insert(belts, new_belt)
  end
end)

function _print(...)
  local args = { n = select("#", ...); ... };
  local string = "";
  for i, player in pairs(game.players) do
    for i = 1, args.n do
        string = string .. serpent.block(args[i]) .. "\t";
    end
    player.print(string);
  end
end


function initalize_globals()
  if global.belts == nil then
    global.belts = {};
    global.pumps = {};
    belts = global.belts;
    pumps = global.pumps;
    script.on_event(defines.events.on_tick, tick_belts)
  end
end

function destroy_globals()
  if #global.belts == 0 then
    belts = nil;
    pumps = nil;
    global.pumps = nil;
    global.pumps = nil;
    script.on_event(defines.events.on_tick, nil);
  end
end

function tick_belts(tick)
  for k, belt in ipairs(belts) do
    if belt.entity.valid ~= true then
      table.remove(belts, k)
      destroy_globals();
    else
      if belt.entity.name == "spawn-belt" then
        
        -- On a lower interval rate, look for chests behind the belt to copy item type
        if tick.tick % chest_detection_rate == 0 then
          x = belt.entity.position.x;
          y = belt.entity.position.y;
          if belt.entity.direction == 0 then
            y = y + 1;
          elseif belt.entity.direction == 2 then
            x = x - 1;
          elseif belt.entity.direction == 4 then
            y = y - 1;
          elseif belt.entity.direction == 6 then
            x = x + 1;
          end

          chests = belt.entity.surface.find_entities_filtered({area = {{x,y},{x,y}}, type="container"});
          if #chests > 0 then
            inventory = chests[1].get_inventory(defines.inventory.chest);
            if inventory ~= nil
            and inventory.valid == true 
            and inventory.is_empty() == false 
            and inventory[1].valid == true
            and inventory[1].valid_for_read == true then
              belt.item = inventory[1].name;
            end
          end
        end
        
        -- Fill the belt with selected item
        line1 = belt.entity.get_transport_line(1);
        if line1.can_insert_at_back() then
          line1.insert_at_back({name = belt.item});
        end
        line2 = belt.entity.get_transport_line(2);
        if line2.can_insert_at_back() then
          line2.insert_at_back({name = belt.item});
        end

      elseif belt.entity.name == "void-belt" then
        belt.entity.get_transport_line(1).clear();
        belt.entity.get_transport_line(2).clear();
      end
    end
  end
end