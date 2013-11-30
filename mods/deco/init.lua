--[[
Pilztest
Copyright (C) 2013 PilzAdam <pilzadam@minetest.net>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

--
-- Nodes
--

minetest.register_node("deco:stonebrick", {
	description = "Stonebrick",
	tiles = {"deco_stonebrick.png"},
	stack_max = 20,
	is_ground_content = false,
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
	is_ground_content = false,
	groups = {cracky=2,stone=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("deco:glass", {
	description = "Glass",
	tiles = {"deco_glass.png"},
	drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	stack_max = 20,
	is_ground_content = false,
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
	is_ground_content = false,
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
	is_ground_content = true,
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
	is_ground_content = true,
	groups = {crumbly=2},
	sounds = {
		footstep = {name="deco_footstep_gravel", gain=0.5},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("deco:bookshelf", {
	description = "Bookshelf",
	tiles = {"base_wood.png", "base_wood.png", "deco_bookshelf.png"},
	stack_max = 20,
	is_ground_content = false,
	groups = {choppy=3},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
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

minetest.register_craft({
	output = "deco:bookshelf",
	recipe = {
		{"base:wood", "base:wood", "base:wood"},
		{"base:leaves", "base:leaves", "base:leaves"},
		{"base:wood", "base:wood", "base:wood"},
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
	wherein        = {"base:dirt", "base:grass"},
	clust_scarcity = 26*26*26,
	clust_num_ores = 200,
	clust_size     = 10,
	height_max     = 500,
	height_min     = -50,
})
