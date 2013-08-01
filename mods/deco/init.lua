
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

minetest.register_node("deco:cactus", {
	description = "Cactus",
	tiles = {"deco_cactus_top.png", "deco_cactus_top.png", "deco_cactus.png"},
	stack_max = 20,
	groups = {choppy=3},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
})

minetest.register_node("deco:gravel", {
	description = "Gravel",
	tiles = {"deco_gravel.png"},
	stack_max = 20,
	groups = {crumbly=2},
	sounds = {
		footstep = {name="deco_footstep_gravel", gain=0.5},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
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

--
-- Mapgen
--

minetest.register_decoration({
	deco_type  = "simple",
	place_on   = "base:sand",
	sidelen    = 16,
	fill_ratio = 0.005,
	biomes = {"base_desert"},
	decoration = "deco:cactus",
	height     = 3,
	height_max = 4,
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "deco:gravel",
	wherein        = {"base:dirt", "base:dirt_with_grass"},
	clust_scarcity = 26*26*26,
	clust_num_ores = 200,
	clust_size     = 10,
	height_max     = 10000,
	height_min     = -10000,
})
