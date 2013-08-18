
--
-- Soil
--

minetest.register_node("food:soil", {
	description = "Soil",
	tiles = {"food_soil.png", "base_dirt.png"},
	stack_max = 20,
	drop = "base:dirt",
	groups = {crumbly=2, not_in_creative_inventory=1},
	sounds = {
		footstep = {name="base_footstep_dirt", gain=1.0},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_node("food:soil_wet", {
	description = "Wet Soil",
	tiles = {"food_soil_wet.png", "food_soil_wet_side.png"},
	stack_max = 20,
	drop = "base:dirt",
	groups = {crumbly=2, not_in_creative_inventory=1, soil=1},
	sounds = {
		footstep = {name="base_footstep_dirt", gain=1.0},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_abm({
	nodenames = {"food:soil", "foos:soil_wet"},
	interval = 15,
	chance = 4,
	action = function(pos, node)
		pos.y = pos.y+1
		local nn = minetest.get_node(pos).name
		pos.y = pos.y-1
		if minetest.registered_nodes[nn] and
				minetest.registered_nodes[nn].walkable and
				minetest.get_item_group(nn, "plant") == 0
		then
			minetest.set_node(pos, {name="base:dirt"})
		end
		
		if node.name == "food:soil" and
				minetest.find_node_near(pos, 3, {"group:water"}) then
			
			if node.name == "food:soil" then
				minetest.set_node(pos, {name="food:soil_wet"})
			end
		else
			if node.name == "food:soil" then
				if minetest.get_item_group(nn, "plant") == 0 then
					minetest.set_node(pos, {name="base:dirt"})
				end
			elseif node.name == "food:soil_wet" then
				minetest.set_node(pos, {name="food:soil"})
			end
		end
	end,
})

--
-- Hoes
--

local function hoe_on_place(itemstack, user, pt, uses)
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)
	
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	
	if above.name ~= "air" then
		return
	end
	
	if under.name ~= "base:dirt" and under.name ~= "base:dirt_with_grass" then
		return
	end
	
	minetest.set_node(pt.under, {name="food:soil"})
	minetest.sound_play("base_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})
	if not minetest.setting_getbool("creative_mode") then
		itemstack:add_wear(65535/(uses-1))
	end
	return itemstack
end

minetest.register_tool("food:hoe_copper", {
	description = "Copper Hoe",
	inventory_image = "food_hoe_copper.png",
	range = 3,
	
	on_place = function(itemstack, user, pointed_thing)
		return hoe_on_place(itemstack, user, pointed_thing, 50)
	end,
})

minetest.register_tool("food:hoe_iron", {
	description = "Iron Hoe",
	inventory_image = "food_hoe_iron.png",
	range = 3,
	
	on_place = function(itemstack, user, pointed_thing)
		return hoe_on_place(itemstack, user, pointed_thing, 150)
	end,
})

minetest.register_tool("food:hoe_mese", {
	description = "Mese Hoe",
	inventory_image = "food_hoe_mese.png",
	range = 3,
	
	on_place = function(itemstack, user, pointed_thing)
		return hoe_on_place(itemstack, user, pointed_thing, 300)
	end,
})

minetest.register_craft({
	output = "food:hoe_copper",
	recipe = {
		{"base:copper_block", "base:copper_block"},
		{"", "group:wood"},
		{"", "group:wood"},
	}
})

minetest.register_craft({
	output = "food:hoe_iron",
	recipe = {
		{"base:iron_block", "base:iron_block"},
		{"", "group:wood"},
		{"", "group:wood"},
	}
})

minetest.register_craft({
	output = "food:hoe_mese",
	recipe = {
		{"base:mese", "base:mese"},
		{"", "group:wood"},
		{"", "group:wood"},
	}
})

--
-- Pumpkin
--

minetest.register_node("food:pumpkin", {
	description = "Pumpkin",
	tiles = {"food_pumpkin_top.png", "food_pumpkin_top.png", "food_pumpkin.png"},
	stack_max = 20,
	groups = {choppy=3, plant=1},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
	
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing and pointed_thing.type ~= "nothing" then
			return itemstack
		end
		local hp = user:get_hp()
		if hp > 0 and hp < 10 then
			user:set_hp(hp+1)
			minetest.log("action", user:get_player_name().." heals 1 HP")
			itemstack:take_item()
			return itemstack
		end
		return itemstack
	end,
})

minetest.register_abm({
	nodenames = {"food:pumpkin"},
	neighbors = {"group:soil"},
	interval = 30,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y - 1
		local nu = minetest.get_node(pos).name
		if minetest.get_item_group(nu, "soil") == 0 then
			return
		end
		
		local minp = {x=pos.x-2, y=pos.y-1, z=pos.z-2}
		local maxp = {x=pos.x+2, y=pos.y+3, z=pos.z+2}
		local soils = minetest.find_nodes_in_area(minp, maxp, {"group:soil"})
		local newpos = soils[math.random(1, #soils)]
		newpos.y = newpos.y + 1
		
		local na = minetest.get_node(newpos).name
		if not minetest.registered_nodes[na] or not minetest.registered_nodes[na].buildable_to then
			return
		end
		minetest.set_node(newpos, node)
	end,
})

minetest.register_decoration({
	deco_type  = "simple",
	place_on   = "base:dirt_with_grass",
	sidelen    = 80,
	fill_ratio = 0.0005,
	biomes = {"base_forest"},
	decoration = "food:pumpkin",
	height     = 1,
})
