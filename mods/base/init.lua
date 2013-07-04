
--
-- Nodes
--

minetest.register_node("base:dirt", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	groups = {crumbly=2},
	sounds = {},
})

minetest.register_node("base:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"base_grass.png", "base_dirt.png", "base_dirt.png^base_grass_side.png"},
	drop = 'base:dirt',
	groups = {crumbly=2},
	sounds = {},
})

minetest.register_node("base:stone", {
	description = "Stone",
	tiles = {"base_stone.png"},
	drop = "base:broken_stone",
	groups = {cracky=3,stone=1},
	sounds = {},
})

minetest.register_node("base:broken_stone", {
	description = "Broken Stone",
	tiles = {"base_broken_stone.png"},
	groups = {cracky=4,stone=1},
	sounds = {},
})

minetest.register_node("base:leaves", {
	description = "Leaves",
	tiles = {"base_leaves.png"},
	drawtype = "allfaces_optional",
	paramtype = "light",
	drop = {
		max_items = 1,
		items = {
			--{items = {'base:sapling'},rarity = 20},
			{items = {'base:leaves'}},
		},
	},
	groups = {snappy=3},
	sounds = {},
})

minetest.register_node("base:tree", {
	description = "Tree",
	tiles = {"base_tree_top.png", "base_tree_top.png", "base_tree.png"},
	groups = {choppy=2},
	sounds = {},
})

minetest.register_node("base:sand", {
	description = "Sand",
	tiles = {"base_sand.png"},
	groups = {crumbly=3},
	sounds = {},
})

minetest.register_node("base:clay", {
	description = "Clay",
	tiles = {"base_clay.png"},
	groups = {crumbly=1},
	sounds = {},
})

minetest.register_node("base:water_source", {
	description = "Water Source",
	inventory_image = minetest.inventorycube("base_water_inventory.png"),
	drawtype = "liquid",
	tiles = {
		{
			name="base_water_source.png",
			animation= {
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=2.0,
			}
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name="base_water_source.png",
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	liquidtype = "source",
	liquid_alternative_flowing = "base:water_flowing",
	liquid_alternative_source = "base:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("base:water_flowing", {
	description = "Water Flowing",
	inventory_image = minetest.inventorycube("base_water_inventory.png"),
	drawtype = "flowingliquid",
	tiles = {"base_water_inventory.png"},
	special_tiles = {
		{
			image="base_water_flowing.png",
			backface_culling=false,
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=0.8,
			},
		},
		{
			image="base_water_flowing.png",
			backface_culling=true,
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	liquidtype = "flowing",
	liquid_alternative_flowing = "base:water_flowing",
	liquid_alternative_source = "base:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

--
-- Tools
--

minetest.register_tool(":", {
	type = "none",
	wield_image = "base_hand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[2]=1.50, [3]=1.00}, uses=0},
			snappy = {times={[3]=0.80}, uses=0},
			cracky = {times={[4]=5.00}, uses=0},
		},
	},
})

minetest.register_tool("base:pick_stone", {
	description = "Stone Pick",
	inventory_image = "base_pick_stone.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {times={[3]=1.80,[4]=1.20}, uses=15}
		},
	},
})

minetest.register_tool("base:axe_stone", {
	description = "Stone Axe",
	inventory_image = "base_axe_stone.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=3.20,[3]=2.60}, uses=15}
		},
	},
})
minetest.register_tool("base:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "base_shovel_stone.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=1.50,[2]=1.00,[3]=0.60}, uses=15}
		},
	},
})

--
-- Craftitems
--

minetest.register_craftitem("base:stick", {
	description = "Stick",
	inventory_image = "base_stick.png",
})

--
-- Crafts
--

minetest.register_craft({
	output = "base:stick",
	recipe = {
		{"", "", "base:leaves"},
		{"", "base:leaves", ""},
		{"base:leaves", "", "",},
	},
})

minetest.register_craft({
	output = "base:pick_stone",
	recipe = {
		{"group:stone", "group:stone", "group:stone"},
		{"", "base:stick", ""},
		{"", "base:stick", ""},
	}
})

minetest.register_craft({
	output = "base:axe_stone",
	recipe = {
		{"group:stone", "group:stone", ""},
		{"group:stone", "base:stick", ""},
		{"", "base:stick", ""},
	}
})

minetest.register_craft({
	output = "base:shovel_stone",
	recipe = {
		{"group:stone"},
		{"base:stick"},
		{"base:stick"},
	}
})

--
-- Mapgen
--

minetest.register_alias("mapgen_water_source", "base:water_source")
minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:dirt_with_grass")

minetest.register_biome({
	name = "base_normal",
	terrain_type = "normal",
	
	top_node = "base:dirt",
	top_depth = 3,
	filler_node = "base:stone",
	filler_height = -15,
	
	height_min = 3,
	height_max = 28,
	heat_point = 40.0,
	humidity_point = 50.0,
})

minetest.register_biome({
	name = "base_forest",
	terrain_type = "normal",
	
	top_node = "base:dirt",
	top_depth = 3,
	filler_node = "base:stone",
	filler_height = -15,
	
	height_min = 8,
	height_max = 28,
	heat_point = 40.0,
	humidity_point = 80.0,
})

minetest.register_biome({
	name = "base_highland",
	terrain_type = "normal",
	
	top_node = "base:dirt",
	top_depth = 3,
	filler_node = "base:stone",
	filler_height = -15,
	
	height_min = 29,
	height_max = 100,
	heat_point = 40.0,
	humidity_point = 50.0,
})

minetest.register_biome({
	name           = "base_ocean_sand",
	terrain_type   = "normal",
	
	top_node       = "base:sand",
	top_depth      = 3,
	filler_node    = "base:stone",
	filler_height  = 0,
	
	height_min     = -31000,
	height_max     = 2,
	heat_point     = 40.0,
	humidity_point = 40.0
})

minetest.register_biome({
	name           = "base_ocean_dirt",
	terrain_type   = "normal",
	
	top_node       = "base:dirt",
	top_depth      = 3,
	filler_node    = "base:stone",
	filler_height  = 0,
	
	height_min     = -31000,
	height_max     = 2,
	heat_point     = 30.0,
	humidity_point = 30.0
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.08,
	biomes = {"base_normal"},
	schematic = minetest.get_modpath("base").."/schematics/base_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "base:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.01,
	biomes = {"base_forest"},
	schematic = minetest.get_modpath("base").."/schematics/base_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:broken_stone",
	wherein        = "base:stone",
	clust_scarcity = 2*2*2,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = 0,
	height_max     = 28,
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
