
--
-- Nodes
--

minetest.register_node("base:dirt", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	stack_max = 20,
	groups = {crumbly=2},
	sounds = {
		footstep = {name="base_footstep_dirt", gain=1.0},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"base_grass.png", "base_dirt.png", "base_dirt.png^base_grass_side.png"},
	drop = 'base:dirt',
	stack_max = 20,
	groups = {crumbly=2},
	sounds = {
		footstep = {name="base_footstep_grass", gain=0.25},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:stone", {
	description = "Stone",
	tiles = {"base_stone.png"},
	drop = "base:broken_stone",
	stack_max = 20,
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
	stack_max = 20,
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
	stack_max = 20,
	groups = {snappy=3},
	sounds = {
		footstep = {name="base_footstep_grass", gain=0.25},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.4},
	},
})

minetest.register_node("base:tree", {
	description = "Tree",
	tiles = {"base_tree_top.png", "base_tree_top.png", "base_tree.png"},
	stack_max = 20,
	groups = {choppy=2},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
})

minetest.register_node("base:sand", {
	description = "Sand",
	tiles = {"base_sand.png"},
	stack_max = 20,
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
	stack_max = 20,
	groups = {crumbly=1},
	sounds = {
		footstep = {name="base_footstep_dirt", gain=1.0},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("base:copper", {
	description = "Copper",
	tiles = {"base_stone.png^base_copper.png"},
	stack_max = 20,
	groups = {cracky=3},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:copper_block", {
	description = "Copper Block",
	tiles = {"base_copper_block.png"},
	stack_max = 20,
	groups = {cracky=3},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:iron", {
	description = "Iron",
	tiles = {"base_stone.png^base_iron.png"},
	stack_max = 20,
	groups = {cracky=2},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
})

minetest.register_node("base:iron_block", {
	description = "Iron",
	tiles = {"base_iron_block.png"},
	stack_max = 20,
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
	stack_max = 20,
	groups = {cracky=4},
	sounds = {
		footstep = {name="base_footstep_hard", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_cracky", gain=0.5},
	},
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

minetest.register_node("base:torch", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {
		{name="base_torch_floor.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="base_torch_ceiling.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="base_torch.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	inventory_image = "base_torch_inventory.png",
	wield_image = "base_torch_inventory.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	stack_max = 20,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {dig_immediate=3,attached_node=1},
	sounds = {
		place = {name="base_place_hard", gain=1.0},
	},
})

local furnace_inactive_formspec =
	"size[8,9]"..
	"image[2,2;1,1;base_furnace_fire_bg.png]"..
	"list[current_name;fuel;2,3;1,1;]"..
	"list[current_name;src;2,1;1,1;]"..
	"list[current_name;dst;5,1;2,2;]"..
	"list[current_player;main;0,5;8,4;]"

minetest.register_node("base:furnace", {
	description = "Furnace",
	tiles = {"base_furnace_side.png", "base_furnace_side.png", "base_furnace_side.png",
		"base_furnace_side.png", "base_furnace_side.png", "base_furnace_front.png"},
	paramtype2 = "facedir",
	stack_max = 1,
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
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
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
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
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
	groups = {cracky=3},
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
	groups = {cracky=3},
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
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
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
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
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

function hacky_swap_node(pos,name)
	local node = minetest.get_node(pos)
	local meta = minetest.get_meta(pos)
	local meta0 = meta:to_table()
	if node.name == name then
		return
	end
	node.name = name
	local meta0 = meta:to_table()
	minetest.set_node(pos,node)
	meta = minetest.get_meta(pos)
	meta:from_table(meta0)
end

minetest.register_abm({
	nodenames = {"base:furnace","base:furnace_active"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		for i, name in ipairs({
				"fuel_totaltime",
				"fuel_time",
				"src_totaltime",
				"src_time"
		}) do
			if meta:get_string(name) == "" then
				meta:set_float(name, 0.0)
			end
		end

		local inv = meta:get_inventory()

		local srclist = inv:get_list("src")
		local cooked = nil
		local aftercooked
		
		if srclist then
			cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		
		local was_active = false
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			was_active = true
			meta:set_float("fuel_time", meta:get_float("fuel_time") + 1)
			meta:set_float("src_time", meta:get_float("src_time") + 1)
			if cooked and cooked.item and meta:get_float("src_time") >= cooked.time then
				-- check if there's room for output in "dst" list
				if inv:room_for_item("dst",cooked.item) and not cooked.item:is_empty() then
					-- Put result in "dst" list
					inv:add_item("dst", cooked.item)
					local wear = tonumber(meta:get_string("wear")) or 0
					wear = wear + 1
					meta:set_string("wear", tostring(wear))
					if wear >= 50 then
						hacky_swap_node(pos, "base:furnace_broken")
						meta:set_string("formspec", furnace_inactive_formspec)
						meta:set_string("infotext", "Broken furnace")
						return
					end
					-- take stuff from "src" list
					inv:set_stack("src", 1, aftercooked.items[1])
				elseif not cooked.item:is_empty() then
					print("Could not insert '"..cooked.item:to_string().."'")
				end
				meta:set_string("src_time", 0)
			end
		end
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			local percent = math.floor(meta:get_float("fuel_time") /
					meta:get_float("fuel_totaltime") * 100)
			meta:set_string("infotext","Furnace active: "..percent.."%")
			hacky_swap_node(pos,"base:furnace_active")
			meta:set_string("formspec",
				"size[8,9]"..
				"image[2,2;1,1;base_furnace_fire_bg.png^[lowpart:"..
				(100-percent)..":base_furnace_fire_fg.png]"..
				"list[current_name;fuel;2,3;1,1;]"..
				"list[current_name;src;2,1;1,1;]"..
				"list[current_name;dst;5,1;2,2;]"..
				"list[current_player;main;0,5;8,4;]"
			)
			return
		end

		local fuel = nil
		local afterfuel
		local cooked = nil
		local fuellist = inv:get_list("fuel")
		local srclist = inv:get_list("src")
		
		if srclist then
			cooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		if fuellist then
			fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
		end

		if fuel.time <= 0 then
			meta:set_string("infotext","Furnace out of fuel")
			hacky_swap_node(pos,"base:furnace")
			meta:set_string("formspec", furnace_inactive_formspec)
			return
		end

		if cooked.item:is_empty() then
			if was_active then
				meta:set_string("infotext","Furnace is empty")
				hacky_swap_node(pos,"base:furnace")
				meta:set_string("formspec", furnace_inactive_formspec)
			end
			return
		end

		meta:set_string("fuel_totaltime", fuel.time)
		meta:set_string("fuel_time", 0)
		
		inv:set_stack("fuel", 1, afterfuel.items[1])
	end,
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
			cracky = {times={[3]=2.50,[4]=1.40}, uses=10},
		},
	},
})

minetest.register_tool("base:axe_stone", {
	description = "Stone Axe",
	inventory_image = "base_axe_stone.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=3.20,[3]=2.60}, uses=10},
			snappy = {times={[3]=0.70}, uses=20},
		},
	},
})
minetest.register_tool("base:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "base_shovel_stone.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=1.50,[2]=1.00,[3]=0.60}, uses=10},
		},
	},
})

minetest.register_tool("base:pick_copper", {
	description = "Copper Pick",
	inventory_image = "base_pick_copper.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {times={[2]=1.90,[3]=1.20,[4]=0.90}, uses=20},
		},
	},
})

minetest.register_tool("base:axe_copper", {
	description = "Copper Axe",
	inventory_image = "base_axe_copper.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=2.40,[3]=1.80}, uses=20},
			snappy = {times={[3]=0.60}, uses=40},
		},
	},
})
minetest.register_tool("base:shovel_copper", {
	description = "Copper Shovel",
	inventory_image = "base_shovel_copper.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=1.00,[2]=0.70,[3]=0.50}, uses=20},
		},
	},
})

minetest.register_tool("base:pick_iron", {
	description = "Iron Pick",
	inventory_image = "base_pick_iron.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {times={[2]=1.20,[3]=0.80,[4]=0.70}, uses=40},
		},
	},
})

minetest.register_tool("base:axe_iron", {
	description = "Iron Axe",
	inventory_image = "base_axe_iron.png",
	tool_capabilities = {
		groupcaps = {
			choppy = {times={[2]=1.50,[3]=1.00}, uses=40},
			snappy = {times={[3]=0.50}, uses=80},
		},
	},
})
minetest.register_tool("base:shovel_iron", {
	description = "Iron Shovel",
	inventory_image = "base_shovel_iron.png",
	tool_capabilities = {
		groupcaps = {
			crumbly = {times={[1]=0.80,[2]=0.60,[3]=0.40}, uses=40},
		},
	},
})

--
-- Craftitems
--

minetest.register_craftitem("base:stick", {
	description = "Stick",
	inventory_image = "base_stick.png",
	stack_max = 20,
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
	output = "base:torch",
	recipe = {
		{"base:coal"},
		{"base:stick"},
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
	output = "base:wood 4",
	recipe = {
		{"base:tree"},
	}
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

minetest.register_craft({
	output = "base:pick_copper",
	recipe = {
		{"base:copper_block", "base:copper_block", "base:copper_block"},
		{"", "base:stick", ""},
		{"", "base:stick", ""},
	}
})

minetest.register_craft({
	output = "base:axe_copper",
	recipe = {
		{"base:copper_block", "base:copper_block", ""},
		{"base:copper_block", "base:stick", ""},
		{"", "base:stick", ""},
	}
})

minetest.register_craft({
	output = "base:shovel_copper",
	recipe = {
		{"base:copper_block"},
		{"base:stick"},
		{"base:stick"},
	}
})

minetest.register_craft({
	output = "base:pick_iron",
	recipe = {
		{"base:iron_block", "base:iron_block", "base:iron_block"},
		{"", "base:stick", ""},
		{"", "base:stick", ""},
	}
})

minetest.register_craft({
	output = "base:axe_iron",
	recipe = {
		{"base:iron_block", "base:iron_block", ""},
		{"base:iron_block", "base:stick", ""},
		{"", "base:stick", ""},
	}
})

minetest.register_craft({
	output = "base:shovel_iron",
	recipe = {
		{"base:iron_block"},
		{"base:stick"},
		{"base:stick"},
	}
})

--
-- Crafts (Furnace)
--

minetest.register_craft({
	type = "fuel",
	recipe = "base:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:coal",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:leaves",
	burntime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "base:coal",
	recipe = "base:tree",
})

minetest.register_craft({
	type = "cooking",
	output = "base:copper_block",
	recipe = "base:copper",
})

minetest.register_craft({
	type = "cooking",
	output = "base:iron_block",
	recipe = "base:iron",
})

minetest.register_craft({
	type = "cooking",
	output = "base:stone",
	recipe = "base:broken_stone",
})

--
-- Mapgen
--

minetest.register_alias("mapgen_water_source", "base:water_source")
minetest.register_alias("mapgen_lava_source", "air")
minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_sand", "base:sand")
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:dirt_with_grass")

minetest.register_biome({
	name = "base_normal",
	
	height_min = 3,
	height_max = 28,
	heat_point = 40.0,
	humidity_point = 40.0,
})

minetest.register_biome({
	name = "base_forest",
	
	height_min = 8,
	height_max = 28,
	heat_point = 40.0,
	humidity_point = 80.0,
})

minetest.register_biome({
	name = "base_highland",
	
	height_min = 29,
	height_max = 100,
	heat_point = 40.0,
	humidity_point = 50.0,
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
	humidity_point = 60.0,
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

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:copper",
	wherein        = "base:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 3,
	clust_size     = 3,
	height_max     = 0,
	height_min     = -50,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:coal_ore",
	wherein        = "base:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 4,
	clust_size     = 3,
	height_max     = -25,
	height_min     = -150,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:iron",
	wherein        = "base:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 3,
	clust_size     = 3,
	height_max     = -100,
	height_min     = -200,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "base:iron",
	wherein        = "base:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 4,
	clust_size     = 3,
	height_max     = -200,
	height_min     = -31000,
})
