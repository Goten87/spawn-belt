super_belt_horizontal = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32
}
super_belt_vertical = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32,
  y = 40,
}
super_belt_ending_top = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32,
  y = 80
}
super_belt_ending_bottom = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32,
  y = 120
}
super_belt_ending_side = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32,
  y = 160
}
super_belt_starting_top = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32,
  y = 200
}
super_belt_starting_bottom = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32,
  y = 240
}
super_belt_starting_side = {
  filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
  priority = "extra-high",
  width = 40,
  height = 40,
  frame_count = 32,
  y = 280
}

data:extend({
  {
    type = "transport-belt",
    name = "spawn-belt",
    icon = "__spawn-belt__/graphics/icons/spawn-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "spawn-belt"},
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/express-transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__spawn-belt__/graphics/entity/spawn-belt/spawn-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12
    },
    belt_horizontal = super_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = super_belt_vertical,
    ending_top = super_belt_ending_top,
    ending_bottom = super_belt_ending_bottom,
    ending_side = super_belt_ending_side,
    starting_top = super_belt_starting_top,
    starting_bottom = super_belt_starting_bottom,
    starting_side = super_belt_starting_side,
    ending_patch = ending_patch_prototype,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.15375
  },
  {
    type = "transport-belt",
    name = "void-belt",
    icon = "__spawn-belt__/graphics/icons/void-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "void-belt"},
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/express-transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__spawn-belt__/graphics/entity/void-belt/void-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12
    },
    belt_horizontal = super_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = super_belt_vertical,
    ending_top = super_belt_ending_top,
    ending_bottom = super_belt_ending_bottom,
    ending_side = super_belt_ending_side,
    starting_top = super_belt_starting_top,
    starting_bottom = super_belt_starting_bottom,
    starting_side = super_belt_starting_side,
    ending_patch = ending_patch_prototype,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.15375
  },
})