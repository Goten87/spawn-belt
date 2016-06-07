require "defines"

local spawn_belts = {}
local void_belts = {}
local spawn_item = "iron-ore"

remote.add_interface("spawnbelt", {
  setitem = function(item)
    spawn_item = item
  end
})

script.on_event(defines.events.on_built_entity, function(entity)
  if entity.created_entity.name == "spawn-belt" then
    table.insert(spawn_belts, entity.created_entity)
  elseif  entity.created_entity.name == "void-belt" then
    table.insert(void_belts, entity.created_entity)
  end
end)

script.on_event(defines.events.on_tick, function(tick)
  for k, belt in ipairs(spawn_belts) do
    if belt.valid ~= true then
      table.remove(spawn_belts, k);
    else
      line1 = belt.get_transport_line(1);
      if line1.can_insert_at_back() then
        line1.insert_at_back({name = spawn_item});
      end
      line2 = belt.get_transport_line(2);
      if line2.can_insert_at_back() then
        line2.insert_at_back({name = spawn_item});
      end
    end
  end
  
  for k, belt in ipairs(void_belts) do
    if belt.valid ~= true then
      table.remove(void_belts, k);
    else
      belt.get_transport_line(1).clear();
      belt.get_transport_line(2).clear();
    end
  end
end)