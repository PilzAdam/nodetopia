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
-- Nodes
--

minetest.register_node("base:dirt", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = {
		footstep = {name="base_footstep_dirt", gain=1.0},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:grass", {
	description = "Dirt with Grass",
	tiles = {"base_grass.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {crumbly=2},
	sounds = {
		footstep = {name="base_footstep_grass", gain=0.25},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})
minetest.register_alias("base:dirt_with_grass", "base:grass")

minetest.register_node("base:snow", {
	description = "Snow",
	tiles = {"base_snow.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = {
		footstep = {name="base_footstep_snow", gain=0.25},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:snowy_grass", {
	description = "Snowy Grass",
	tiles = {"base_snowy_grass.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {crumbly=2},
	sounds = {
		footstep = {name="base_footstep_grass", gain=0.25},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:ice", {
	description = "Ice",
	tiles = {"base_ice.png"},
	drawtype = "glasslike",
	use_texture_alpha = true,
	paramtype = "light",
	stack_max = 256,
	is_ground_content = false, -- caves also dont remove water
	groups = {cracky=4},
	sounds = {
		footstep = {name="base_footstep_glass", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:stone", {
	description = "Stone",
	tiles = {"base_stone.png"},
	drop = "base:broken_stone",
	stack_max = 256,
	is_ground_content = true,
	groups = {cracky=2,stone=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:broken_stone", {
	description = "Broken Stone",
	tiles = {"base_broken_stone.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {cracky=4,stone=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:leaves", {
	description = "Leaves",
	tiles = {"base_leaves.png"},
	paramtype = "light",
	stack_max = 256,
	is_ground_content = false,
	groups = {snappy=3,fuel=2,leaves=1},
	sounds = {
		footstep = {name="base_footstep_grass", gain=0.25},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.4},
	},
})

minetest.register_node("base:snowy_leaves", {
	description = "Snowy Leaves",
	tiles = {"base_snowy_leaves.png"},
	paramtype = "light",
	stack_max = 256,
	is_ground_content = false,
	groups = {snappy=3,fuel=2,leaves=1},
	sounds = {
		footstep = {name="base_footstep_grass", gain=0.25},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.4},
	},
})

minetest.register_node("base:tree", {
	description = "Tree",
	tiles = {"base_tree_top.png", "base_tree_top.png", "base_tree.png"},
	stack_max = 256,
	is_ground_content = false,
	groups = {choppy=2,tree=1,fuel=20},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
})

minetest.register_node("base:jungletree", {
	description = "Jungletree",
	tiles = {"base_jungletree_top.png", "base_jungletree_top.png", "base_jungletree.png"},
	stack_max = 256,
	is_ground_content = false,
	groups = {choppy=2,tree=1,fuel=20},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
})

minetest.register_node("base:wood", {
	description = "Wood",
	tiles = {"base_wood.png"},
	stack_max = 256,
	is_ground_content = false,
	groups = {choppy=3,wood=1,fuel=10},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
})

minetest.register_node("base:junglewood", {
	description = "Junglewood",
	tiles = {"base_junglewood.png"},
	stack_max = 256,
	is_ground_content = false,
	groups = {choppy=3,wood=1,fuel=10},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
})

minetest.register_node("base:sand", {
	description = "Sand",
	tiles = {"base_sand.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = {
		footstep = {name="base_footstep_sand", gain=0.5},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:clay", {
	description = "Clay",
	tiles = {"base_clay.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {crumbly=1},
	sounds = {
		footstep = {name="base_footstep_dirt", gain=1.0},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:copper_ore", {
	description = "Copper Ore",
	tiles = {"base_stone.png^base_copper_ore.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:copper", {
	description = "Copper",
	tiles = {"base_copper.png"},
	stack_max = 256,
	is_ground_content = false,
	groups = {cracky=3},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:iron_ore", {
	description = "Iron Ore",
	tiles = {"base_stone.png^base_iron_ore.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:iron", {
	description = "Iron",
	tiles = {"base_iron.png"},
	stack_max = 256,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:coal_ore", {
	description = "Coal Ore",
	tiles = {"base_stone.png^base_coal_ore.png"},
	drop = "base:coal",
	is_ground_content = true,
	groups = {cracky=2},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:coal", {
	description = "Coal",
	tiles = {"base_coal.png"},
	stack_max = 256,
	is_ground_content = false,
	groups = {cracky=4,fuel=30},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:mese", {
	description = "Mese",
	tiles = {"base_mese.png"},
	stack_max = 256,
	is_ground_content = true,
	groups = {cracky=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

local function place_liquid(itemstack, placer, pointed_thing)
	local item = itemstack:peek_item()
	local def = itemstack:get_definition()
	if def.type ~= "node" or pointed_thing.type ~= "node" then
		return itemstack
	end
	
	local under = pointed_thing.under
	local oldnode_under = minetest.get_node_or_nil(under)
	local above = pointed_thing.above
	local oldnode_above = minetest.get_node_or_nil(above)
	
	if not oldnode_under or not oldnode_above then
		minetest.log("info", placer:get_player_name() .. " tried to place"
			.. " node in unloaded position " .. minetest.pos_to_string(above))
		return itemstack
	end
	
	local olddef_under = ItemStack({name=oldnode_under.name}):get_definition()
	olddef_under = olddef_under or minetest.nodedef_default
	local olddef_above = ItemStack({name=oldnode_above.name}):get_definition()
	olddef_above = olddef_above or minetest.nodedef_default
	
	if not (olddef_above.buildable_to and olddef_above.liquidtype == "none")
			and not (olddef_under.buildable_to and olddef_under.liquidtype == "none") then
		minetest.log("info", placer:get_player_name() .. " tried to place"
			.. " node in invalid position " .. minetest.pos_to_string(above)
			.. ", replacing " .. oldnode_above.name)
		return itemstack
	end
	
	-- Place above pointed node
	local place_to = {x = above.x, y = above.y, z = above.z}
	
	-- If node under is buildable_to, place into it instead (eg. snow)
	if olddef_under.buildable_to and olddef_under.liquidtype == "none" then
		minetest.log("info", "node under is buildable to")
		place_to = {x = under.x, y = under.y, z = under.z}
	end
	
	minetest.log("action", placer:get_player_name() .. " places node "
		.. def.name .. " at " .. minetest.pos_to_string(place_to))
	
	local oldnode = minetest.get_node(place_to)
	local newnode = {name = def.name, param1 = 0, param2 = 0}
	
	-- Calculate direction for wall mounted stuff like torches and signs
	if def.paramtype2 == 'wallmounted' then
		local dir = {
			x = under.x - above.x,
			y = under.y - above.y,
			z = under.z - above.z
		}
		newnode.param2 = minetest.dir_to_wallmounted(dir)
	-- Calculate the direction for furnaces and chests and stuff
	elseif def.paramtype2 == 'facedir' then
		local placer_pos = placer:getpos()
		if placer_pos then
			local dir = {
				x = above.x - placer_pos.x,
				y = above.y - placer_pos.y,
				z = above.z - placer_pos.z
			}
			newnode.param2 = minetest.dir_to_facedir(dir)
			minetest.log("action", "facedir: " .. newnode.param2)
		end
	end
	
	-- Check if the node is attached and if it can be placed there
	if minetest.get_item_group(def.name, "attached_node") ~= 0 and
		not check_attached_node(place_to, newnode) then
		minetest.log("action", "attached node " .. def.name ..
			" can not be placed at " .. minetest.pos_to_string(place_to))
		return itemstack
	end
	
	-- Add node and update
	minetest.add_node(place_to, newnode)
	
	local take_item = true
	
	-- Run callback
	if def.after_place_node then
		-- Copy place_to because callback can modify it
		local place_to_copy = {x=place_to.x, y=place_to.y, z=place_to.z}
		if def.after_place_node(place_to_copy, placer, itemstack) then
			take_item = false
		end
	end
	
	-- Run script hook
	local _, callback
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Copy pos and node because callback can modify them
		local place_to_copy = {x=place_to.x, y=place_to.y, z=place_to.z}
		local newnode_copy = {name=newnode.name, param1=newnode.param1, param2=newnode.param2}
		local oldnode_copy = {name=oldnode.name, param1=oldnode.param1, param2=oldnode.param2}
		if callback(place_to_copy, newnode_copy, placer, oldnode_copy, itemstack) then
			take_item = false
		end
	end
	
	if take_item then
		itemstack:take_item()
	end
	return itemstack
end

minetest.register_node("base:water", {
	description = "Water",
	inventory_image = minetest.inventorycube("base_water_inventory.png"),
	drawtype = "liquid",
	tiles = {
		{
			name="base_water.png",
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
			name="base_water.png",
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
	buildable_to = false,
	stack_max = 256,
	liquidtype = "source",
	liquid_alternative_flowing = "base:water",
	liquid_alternative_source = "base:water",
	liquid_range = 0,
	liquids_pointable = true,
	liquid_renewable = false,
	liquid_viscosity = 1,
	drowning = 1,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {liquid=3, water=1},
	
	on_place = place_liquid,
})

minetest.register_node("base:lava", {
	description = "Lava",
	inventory_image = minetest.inventorycube("base_lava_inventory.png"),
	drawtype = "liquid",
	tiles = {
		{
			name="base_lava.png",
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
			name="base_lava.png",
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = 14,
	damage_per_second = 4,
	walkable = false,
	pointable = false,
	buildable_to = false,
	stack_max = 256,
	liquidtype = "source",
	liquid_alternative_flowing = "base:lava",
	liquid_alternative_source = "base:lava",
	liquid_range = 0,
	liquids_pointable = true,
	liquid_renewable = false,
	liquid_viscosity = 7,
	drowning = 1,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {liquid=2,lava=1,fuel=50},
	
	on_place = place_liquid,
})

minetest.register_alias("base:water_flowing", "air");
minetest.register_alias("base:water_source", "base:water");
minetest.register_alias("base:lava_flowing", "air");
minetest.register_alias("base:lava_source", "base:lava");

minetest.register_abm({
	nodenames = {"group:lava"},
	neighbors = {"group:water"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name="base:stone"})
		minetest.sound_play("base_lava_cool", {pos = pos,  gain = 0.25})
	end,
})

minetest.register_node("base:lamp", {
	description = "Lamp",
	tiles = {"base_lamp.png"},
	paramtype = "light",
	light_source = 13,
	stack_max = 256,
	is_ground_content = false,
	groups = {choppy=3},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
})

local furnace_inactive_formspec =
	"size[6,4.5]"..
	"image[1,1;1,1;base_furnace_fire_bg.png]"..
	"list[current_name;fuel;1,2;1,1;]"..
	"list[current_name;src;1,0;1,1;]"..
	"list[current_name;dst;3,0;2,2;]"..
	"list[current_player;main;0,3.5;6,1;]"..
	
	"listcolors[#0000;#FFF3]"..
	"bgcolor[#000000A0;true]"..
	"background[-0.0625,-0.0625;6.125,4.625;base_furnace_formspec_background.png]"..
	"background[0,3.5;6,1;backpack_inventory.png]"..
	"background[1,0;4,3;base_furnace_formspec_inventory.png]"

minetest.register_node("base:furnace", {
	description = "Furnace",
	tiles = {"base_furnace_side.png", "base_furnace_side.png", "base_furnace_side.png",
		"base_furnace_side.png", "base_furnace_side.png", "base_furnace_front.png"},
	paramtype2 = "facedir",
	stack_max = 1,
	is_ground_content = false,
	groups = {cracky=3},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local inv = digger:get_inventory()
		-- Search our item
		for i,stack in ipairs(inv:get_list("main")) do
			if stack:get_name() == "base:furnace" and stack:get_metadata() == "" then
				local tmp = stack:to_table()
				tmp.metadata = oldmetadata.fields.wear
				inv:set_stack("main", i, tmp)
			end
		end
	end,
	after_place_node = function(pos, placer, itemstack)
		local wear = tonumber(itemstack:get_metadata())
		if wear then
			minetest.get_meta(pos):set_string("wear", tostring(wear))
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if minetest.get_item_group(stack:get_name(), "fuel") ~= 0 then
				return stack:get_count()
			else
				return 0
			end
		elseif listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "fuel" then
			if minetest.get_item_group(stack:get_name(), "fuel") ~= 0 then
				return count
			else
				return 0
			end
		elseif to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

minetest.register_node("base:furnace_broken", {
	description = "Broken Furnace",
	tiles = {"base_furnace_side_broken.png", "base_furnace_side_broken.png", "base_furnace_side_broken.png",
		"base_furnace_side_broken.png", "base_furnace_side_broken.png", "base_furnace_front_broken.png"},
	paramtype2 = "facedir",
	drop = "",
	is_ground_content = false,
	groups = {cracky=3,not_in_creative_inventory=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
})

minetest.register_node("base:furnace_active", {
	description = "Furnace",
	tiles = {"base_furnace_side.png", "base_furnace_side.png", "base_furnace_side.png",
		"base_furnace_side.png", "base_furnace_side.png", "base_furnace_front_active.png"},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "base:furnace",
	is_ground_content = false,
	groups = {cracky=3,not_in_creative_inventory=1},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace");
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local inv = digger:get_inventory()
		-- Search our item
		for i,stack in ipairs(inv:get_list("main")) do
			if stack:get_name() == "base:furnace" and stack:get_metadata() == "" then
				local tmp = stack:to_table()
				tmp.metadata = oldmetadata.fields.wear
				inv:set_stack("main", i, tmp)
			end
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if minetest.get_item_group(stack:get_name(), "fuel") ~= 0 then
				return stack:get_count()
			else
				return 0
			end
		elseif listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "fuel" then
			if minetest.get_item_group(stack:get_name(), "fuel") ~= 0 then
				return count
			else
				return 0
			end
		elseif to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

minetest.register_abm({
	nodenames = {"base:furnace","base:furnace_active"},
	interval = 3.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local wear = tonumber(meta:get_string("wear")) or 0
		
		local fueltime = tonumber(meta:get_string("fueltime")) or 0
		if fueltime == 0 then
			local fuel = inv:get_stack("fuel", 1)
			if not fuel:is_empty() then
				local newtime = minetest.get_item_group(fuel:get_name(), "fuel")
				fueltime = newtime
				if newtime ~= 0 then
					fuel:take_item()
					inv:set_stack("fuel", 1, fuel)
				end
			end
		else
			fueltime = fueltime-1
		end
		meta:set_string("fueltime", fueltime)
		
		if fueltime ~= 0 then
			if node.name == "base:furnace" then
				node.name = "base:furnace_active"
				minetest.swap_node(pos, node)
				meta:set_string("infotext", "Active Furnace")
				meta:set_string("formspec", "size[6,4.5]"..
					"image[1,1;1,1;base_furnace_fire_fg.png]"..
					"list[current_name;fuel;1,2;1,1;]"..
					"list[current_name;src;1,0;1,1;]"..
					"list[current_name;dst;3,0;2,2;]"..
					"list[current_player;main;0,3.5;6,1;]"..
					
					"listcolors[#0000;#FFF3]"..
					"bgcolor[#000000A0;true]"..
					"background[-0.0625,-0.0625;6.125,4.625;base_furnace_formspec_background.png]"..
					"background[0,3.5;6,1;backpack_inventory.png]"..
					"background[1,0;4,3;base_furnace_formspec_inventory.png]"
				)
			end
			
			local src = inv:get_stack("src", 1)
			if not src:is_empty() then
				local cooked = minetest.get_craft_result({
					method = "cooking",
					width = 1,
					items = {src},
				})
				if not cooked.item:is_empty() then
					src:take_item()
					inv:set_stack("src", 1, src)
					inv:add_item("dst", cooked.item)
					wear = wear+1
				end
			end
		else
			if node.name == "base:furnace_active" then
				node.name = "base:furnace"
				minetest.swap_node(pos, node)
				meta:set_string("infotext", "Furnace")
				meta:set_string("formspec", furnace_inactive_formspec)
			end
		end
		
		meta:set_string("wear", wear)
		if wear >= 50 then
			node.name = "base:furnace_broken"
			minetest.swap_node(pos, node)
			meta:set_string("formspec", furnace_inactive_formspec)
			meta:set_string("infotext", "Broken Furnace")
		end
	end,
})

minetest.register_node("base:chest", {
	description = "Chest",
	tiles = {"base_chest_top.png", "base_chest_top.png", "base_chest_side.png",
		"base_chest_side.png", "base_chest_side.png", "base_chest_front.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy=3},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,5.5]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;1,4.5;6,1;]"..
				
				"listcolors[#0000;#FFF3]"..
				"bgcolor[#000000A0;true]"..
				"background[-0.0625,-0.0625;8.125,5.625;base_chest_formspec_background.png]"..
				"background[1,4.5;6,1;backpack_inventory.png]"..
				"background[0,0;8,4;base_chest_formspec_inventory.png]"
		)
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})

--
-- Tools
--

minetest.register_tool(":", {
	type = "none",
	wield_image = "base_hand.png",
	wield_scale = {x=1,y=1,z=1.5},
	range = 3,
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[3]=0.90}, uses=0},
			snappy = {times={[3]=0.70}, uses=0},
			cracky = {times={[4]=3.00}, uses=0},
		},
	},
})

minetest.register_tool("base:pick_stone", {
	description = "Stone Pick",
	inventory_image = "base_pick_stone.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {times={[3]=1.50,[4]=0.90}, uses=15},
		},
		damage_groups = {cracky=20},
	},
})

minetest.register_tool("base:axe_stone", {
	description = "Stone Axe",
	inventory_image = "base_axe_stone.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=2.00,[3]=1.00}, uses=15},
			snappy = {times={[3]=0.50}, uses=45},
		},
	},
})
minetest.register_tool("base:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "base_shovel_stone.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=1.00,[2]=0.60,[3]=0.50}, uses=15},
		},
	},
})

minetest.register_tool("base:pick_copper", {
	description = "Copper Pick",
	inventory_image = "base_pick_copper.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {times={[2]=0.90,[3]=0.90,[4]=0.70}, uses=25},
		},
		damage_groups = {cracky=25},
	},
})

minetest.register_tool("base:axe_copper", {
	description = "Copper Axe",
	inventory_image = "base_axe_copper.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=1.50,[3]=0.80}, uses=25},
			snappy = {times={[3]=0.40}, uses=75},
		},
	},
})
minetest.register_tool("base:shovel_copper", {
	description = "Copper Shovel",
	inventory_image = "base_shovel_copper.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=0.80,[2]=0.50,[3]=0.40}, uses=25},
		},
	},
})

minetest.register_tool("base:bucket_copper", {
	description = "Copper Bucket",
	inventory_image = "base_bucket_copper.png",
	liquids_pointable = true,
	tool_capabilities = {
		groupcaps = {
			liquid = {times={[3]=1.50}, uses=10},
		},
	},
})

minetest.register_tool("base:pick_iron", {
	description = "Iron Pick",
	inventory_image = "base_pick_iron.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {times={[1]=5.00,[2]=0.70,[3]=0.70,[4]=0.50}, uses=45},
		},
		damage_groups = {cracky=40},
	},
})

minetest.register_tool("base:axe_iron", {
	description = "Iron Axe",
	inventory_image = "base_axe_iron.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=1.20,[3]=0.60}, uses=45},
			snappy = {times={[3]=0.30}, uses=135},
		},
	},
})
minetest.register_tool("base:shovel_iron", {
	description = "Iron Shovel",
	inventory_image = "base_shovel_iron.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=0.60,[2]=0.40,[3]=0.30}, uses=55},
		},
	},
})

minetest.register_tool("base:bucket_iron", {
	description = "Iron Bucket",
	inventory_image = "base_bucket_iron.png",
	liquids_pointable = true,
	tool_capabilities = {
		groupcaps = {
			liquid = {times={[2]=2.00,[3]=1.00}, uses=20},
		},
	},
})

minetest.register_tool("base:pick_mese", {
	description = "Mese Pick",
	inventory_image = "base_pick_mese.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {times={[1]=2.00,[2]=0.50,[3]=0.50,[4]=0.30}, uses=80},
		},
		damage_groups = {cracky=50},
	},
})

minetest.register_tool("base:axe_mese", {
	description = "Mese Axe",
	inventory_image = "base_axe_mese.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=0.90,[3]=0.40}, uses=80},
			snappy = {times={[3]=0.20}, uses=240},
		},
	},
})
minetest.register_tool("base:shovel_mese", {
	description = "Mese Shovel",
	inventory_image = "base_shovel_mese.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=0.40,[2]=0.30,[3]=0.20}, uses=100},
		},
	},
})

--
-- Crafts
--

minetest.register_craft({
	output = "base:wood 2",
	recipe = {
		{"group:leaves", "group:leaves"},
		{"group:leaves", "group:leaves"},
	},
})

minetest.register_craft({
	output = "base:lamp 4",
	recipe = {
		{"", "group:wood", ""},
		{"group:wood", "base:coal", "group:wood"},
		{"", "group:wood", ""},
	},
})

minetest.register_craft({
	output = "base:furnace",
	recipe = {
		{"base:clay", "base:clay", "base:clay"},
		{"base:clay", "", "base:clay"},
		{"base:clay", "base:clay", "base:clay"},
	}
})

minetest.register_craft({
	output = "base:chest",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

minetest.register_craft({
	output = "base:wood 2",
	recipe = {
		{"base:tree"},
	}
})

minetest.register_craft({
	output = "base:junglewood 2",
	recipe = {
		{"base:jungletree"},
	}
})

minetest.register_craft({
	output = "base:pick_stone",
	recipe = {
		{"group:stone", "group:stone", "group:stone"},
		{"", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:axe_stone",
	recipe = {
		{"group:stone", "group:stone", ""},
		{"group:stone", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:shovel_stone",
	recipe = {
		{"group:stone"},
		{"group:wood"},
		{"group:wood"},
	}
})

minetest.register_craft({
	output = "base:pick_copper",
	recipe = {
		{"base:copper", "base:copper", "base:copper"},
		{"", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:axe_copper",
	recipe = {
		{"base:copper", "base:copper", ""},
		{"base:copper", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:shovel_copper",
	recipe = {
		{"base:copper"},
		{"group:wood"},
		{"group:wood"},
	}
})

minetest.register_craft({
	output = "base:bucket_copper",
	recipe = {
		{"base:copper", "", "base:copper"},
		{"", "base:copper", ""},
	}
})

minetest.register_craft({
	output = "base:pick_iron",
	recipe = {
		{"base:iron", "base:iron", "base:iron"},
		{"", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:axe_iron",
	recipe = {
		{"base:iron", "base:iron", ""},
		{"base:iron", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:shovel_iron",
	recipe = {
		{"base:iron"},
		{"group:wood"},
		{"group:wood"},
	}
})

minetest.register_craft({
	output = "base:bucket_iron",
	recipe = {
		{"base:iron", "", "base:iron"},
		{"", "base:iron", ""},
	}
})

minetest.register_craft({
	output = "base:pick_mese",
	recipe = {
		{"base:mese", "base:mese", "base:mese"},
		{"", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:axe_mese",
	recipe = {
		{"base:mese", "base:mese", ""},
		{"base:mese", "group:wood", ""},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "base:shovel_mese",
	recipe = {
		{"base:mese"},
		{"group:wood"},
		{"group:wood"},
	}
})

--
-- Crafts (Furnace)
--

minetest.register_craft({
	type = "cooking",
	output = "base:coal",
	recipe = "group:tree",
})

minetest.register_craft({
	type = "cooking",
	output = "base:copper",
	recipe = "base:copper_ore",
})

minetest.register_craft({
	type = "cooking",
	output = "base:iron",
	recipe = "base:iron_ore",
})

minetest.register_craft({
	type = "cooking",
	output = "base:stone",
	recipe = "base:broken_stone",
})

dofile(minetest.get_modpath("base").."/mapgen.lua")
