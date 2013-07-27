
--
-- Nodes
--

minetest.register_node("deco:stonebrick", {
	description = "Stonebrick",
	tiles = {"deco_stonebrick.png"},
	stack_max = 20,
	groups = {cracky=2,stone=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("deco:sandstonebrick", {
	description = "Sandstonebrick",
	tiles = {"deco_sandstonebrick.png"},
	stack_max = 20,
	groups = {cracky=2,stone=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("deco:glass", {
	description = "Sand",
	tiles = {"deco_glass.png"},
	drawtype = "glasslike",
	paramtype = "light",
	drop = "",
	stack_max = 20,
	groups = {cracky=4},
	sounds = {
		footstep = {name="base_footstep_glass", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
		dug = {name="base_dug_glass", gain=1.0},
	},
})

minetest.register_node("deco:brick", {
	description = "Brick",
	tiles = {"deco_brick.png"},
	stack_max = 20,
	groups = {cracky=2,stone=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

--
-- Crafts
--

minetest.register_craft({
	output = "deco:stonebrick 4",
	recipe = {
		{"base:stone", "base:stone"},
		{"base:stone", "base:stone"},
	},
})

minetest.register_craft({
	output = "deco:sandstonebrick 4",
	recipe = {
		{"base:sand", "base:stone"},
		{"base:stone", "base:sand"},
	},
})

--
-- Crafts (furnace)
--

minetest.register_craft({
	type = "cooking",
	output = "deco:glass",
	recipe = "base:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "deco:brick",
	recipe = "base:clay",
})
