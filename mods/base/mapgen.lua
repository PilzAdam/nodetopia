--[[
Nodetopia
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
-- Mapgen
--

minetest.register_on_mapgen_init(function(params)
	minetest.set_mapgen_params({
		mgname = "v7",
		seed = params.seed,
		water_level = 1,
		flags = "caves",
		flagmask = "trees, caves, flat, v6_biome_blend, v6_jungles, dungeons, nolight",
	})
end)

minetest.register_alias("mapgen_water_source", "base:water")
minetest.register_alias("mapgen_lava_source", "base:lava")
minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:grass")

--
-- Average Temp
--

minetest.register_biome({
	name = "base_forest",
	
	node_top       = "base:grass",
	depth_top      = 1,
	node_filler    = "base:dirt",
	depth_filler   = 3,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 50,
	humidity_point = 40,
})

minetest.register_biome({
	name = "base_ocean_forest",
	
	node_top       = "base:sand",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:water",
	node_dust_water= "base:water",
	
	height_min     = -31000,
	height_max     = 1,
	heat_point     = 50,
	humidity_point = 40,
})

minetest.register_biome({
	name = "base_grass_dry",
	
	node_top       = "base:grass",
	depth_top      = 1,
	node_filler    = "base:dirt",
	depth_filler   = 3,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 50,
	humidity_point = 0,
})

minetest.register_biome({
	name = "base_ocean_grass_dry",
	
	node_top       = "base:dirt",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:water",
	node_dust_water= "base:water",
	
	height_min     = -31000,
	height_max     = 1,
	heat_point     = 50,
	humidity_point = 0,
})

minetest.register_biome({
	name = "base_grass_wet",
	
	node_top       = "base:grass",
	depth_top      = 1,
	node_filler    = "base:dirt",
	depth_filler   = 3,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 50,
	humidity_point = 80,
})

minetest.register_biome({
	name = "base_ocean_grass_wet",
	
	node_top       = "base:sand",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:water",
	node_dust_water= "base:water",
	
	height_min     = -31000,
	height_max     = 1,
	heat_point     = 50,
	humidity_point = 80,
})

--
-- Low temp
--

minetest.register_biome({
	name = "base_tundra",
	
	node_top       = "base:snow",
	depth_top      = 2,
	node_filler    = "base:dirt",
	depth_filler   = 3,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 10,
	humidity_point = 0,
})

minetest.register_biome({
	name = "base_ocean_tundra",
	
	node_top       = "base:dirt",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:ice",
	node_dust_water= "base:ice",
	
	height_min     = -10,
	height_max     = 1,
	heat_point     = 10,
	humidity_point = 0,
})

minetest.register_biome({
	name = "base_taiga",
	
	node_top       = "base:snowy_grass",
	depth_top      = 1,
	node_filler    = "base:dirt",
	depth_filler   = 3,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 10,
	humidity_point = 40,
})

minetest.register_biome({
	name = "base_ocean_taiga",
	
	node_top       = "base:dirt",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:water",
	node_dust_water= "base:ice",
	
	height_min     = -31000,
	height_max     = 1,
	heat_point     = 10,
	humidity_point = 40,
})

--
-- High Temp
--

minetest.register_biome({
	name = "base_desert",
	
	node_top       = "base:sand",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 90,
	humidity_point = 0,
})

minetest.register_biome({
	name = "base_ocean_desert",
	
	node_top       = "base:sand",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:water",
	node_dust_water= "base:water",
	
	height_min     = -31000,
	height_max     = 1,
	heat_point     = 90,
	humidity_point = 0,
})

minetest.register_biome({
	name = "base_savanna",
	
	node_top       = "base:grass",
	depth_top      = 1,
	node_filler    = "base:dirt",
	depth_filler   = 3,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 90,
	humidity_point = 40,
})

minetest.register_biome({
	name = "base_ocean_savanna",
	
	node_top       = "base:sand",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:water",
	node_dust_water= "base:water",
	
	height_min     = -31000,
	height_max     = 1,
	heat_point     = 90,
	humidity_point = 40,
})

minetest.register_biome({
	name = "base_jungle",
	
	node_top       = "base:grass",
	depth_top      = 1,
	node_filler    = "base:dirt",
	depth_filler   = 3,
	node_dust      = "air",
	
	height_min     = 1,
	height_max     = 100,
	heat_point     = 90,
	humidity_point = 80,
})

minetest.register_biome({
	name = "base_ocean_jungle",
	
	node_top       = "base:sand",
	depth_top      = 5,
	node_filler    = "base:stone",
	depth_filler   = 0,
	node_water     = "base:water",
	node_dust_water= "base:water",
	
	height_min     = -31000,
	height_max     = 1,
	heat_point     = 90,
	humidity_point = 80,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:grass",
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"base_grass_wet"},
	schematic = minetest.get_modpath("base").."/schematics/base_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"base_forest"},
	schematic = minetest.get_modpath("base").."/schematics/base_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:grass",
	sidelen = 8,
	fill_ratio = 0.2,
	biomes = {"base_jungle"},
	schematic = minetest.get_modpath("base").."/schematics/base_jungletree.mts",
	flags = "place_center_x, place_center_z",
})


minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:snowy_grass",
	sidelen = 16,
	fill_ratio = 0.02,
	biomes = {"base_taiga"},
	schematic = minetest.get_modpath("base").."/schematics/base_fir.mts",
	flags = "place_center_x, place_center_z",
	replacements = {
		{"base:leaves", "base:snowy_leaves"},
	},
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:broken_stone",
	wherein        = "base:stone",
	clust_scarcity = 2*2*2,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -10,
	height_max     = 31000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:clay",
	wherein        = "base:sand",
	clust_scarcity = 15*15*15,
	clust_num_ores = 64,
	clust_size     = 5,
	height_max     = 0,
	height_min     = -31000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:copper_ore",
	wherein        = "base:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 3,
	clust_size     = 3,
	height_max     = 0,
	height_min     = -80,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:coal_ore",
	wherein        = "base:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 4,
	clust_size     = 3,
	height_max     = -20,
	height_min     = -200,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:iron_ore",
	wherein        = "base:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 3,
	clust_size     = 3,
	height_max     = -80,
	height_min     = -200,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:iron_ore",
	wherein        = "base:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 4,
	clust_size     = 3,
	height_max     = -201,
	height_min     = -31000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:mese",
	wherein        = "base:stone",
	clust_scarcity = 16*16*16,
	clust_num_ores = 3,
	clust_size     = 2,
	height_max     = -256,
	height_min     = -31000,
})
