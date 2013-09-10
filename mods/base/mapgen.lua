--
-- Mapgen
--

minetest.register_on_mapgen_init(function(params)
	if params.mgname ~= "v7" then
		minetest.log("error", "Pilztest requires mapgen v7")
	end
end)

minetest.register_alias("mapgen_water_source", "base:water_source")
minetest.register_alias("mapgen_lava_source", "base:lava_source")
minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_sand", "base:sand")
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:dirt_with_grass")

minetest.register_biome({
	name           = "base_normal",
	
	height_min     = 3,
	height_max     = 40,
	heat_point     = 40.0,
	humidity_point = 40.0,
})

minetest.register_biome({
	name           = "base_forest",
	
	height_min     = 3,
	height_max     = 40,
	heat_point     = 40.0,
	humidity_point = 55.0,
})

minetest.register_biome({
	name           = "base_jungle",
	
	height_min     = 3,
	height_max     = 40,
	heat_point     = 60.0,
	humidity_point = 70.0,
})

minetest.register_biome({
	name           = "base_firforest",
	
	height_min     = 3,
	height_max     = 40,
	heat_point     = 20.0,
	humidity_point = 55.0,
})

minetest.register_biome({
	name           = "base_highland",
	
	height_min     = 41,
	height_max     = 31000,
	heat_point     = 40.0,
	humidity_point = 40.0,
})

minetest.register_biome({
	name           = "base_ocean_sand",
	
	node_top       = "base:sand",
	depth_top      = 3,
	node_filler    = "base:stone",
	depth_filler   = 0,
	
	height_min     = -31000,
	height_max     = 2,
	heat_point     = 40.0,
	humidity_point = 40.0,
})

minetest.register_biome({
	name           = "base_ocean_dirt",
	
	height_min     = -31000,
	height_max     = 2,
	heat_point     = 20.0,
	humidity_point = 40.0,
})

minetest.register_biome({
	name           = "base_desert",
	
	node_top       = "base:sand",
	depth_top      = 20,
	node_filler    = "base:stone",
	
	height_min     = 3,
	height_max     = 80,
	heat_point     = 90.0,
	humidity_point = 0.0,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"base_normal"},
	schematic = minetest.get_modpath("base").."/schematics/base_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"base_forest"},
	schematic = minetest.get_modpath("base").."/schematics/base_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.2,
	biomes = {"base_jungle"},
	schematic = minetest.get_modpath("base").."/schematics/base_jungletree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.02,
	biomes = {"base_firforest"},
	schematic = minetest.get_modpath("base").."/schematics/base_fir.mts",
	flags = "place_center_x, place_center_z",
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
