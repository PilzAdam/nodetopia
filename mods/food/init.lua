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
-- Hunger
--

food = {}
food.speed = {} -- save the speed for the models mod
local hunger = {}
local timer = 0

file = io.open(minetest:get_worldpath().."/hunger.txt", "r")
if file then
		local table = minetest.deserialize(file:read("*all"))
		if type(table) == "table" then
			hunger = table
		else
			minetest.log("error", "Corrupted hunger file")
		end
		file:close()
end

local function update_player_hunger(player, hunger, force)
	if minetest.setting_getbool("creative_mode") then
		return
	end
	
	if hunger > 40 then
		player:set_hp(player:get_hp()-1)
		minetest.log("action", player:get_player_name() .. " is hungry and gets damaged")
	end
	
	local hunger = math.min(hunger, 21)
	if force and hunger <= 10 then
		player:set_physics_override({
			speed = 1,
		})
		food.speed[player:get_player_name()] = 1
	end
	if hunger > 10 and (force or hunger < 21) then
		local tmp = math.abs(hunger-20)  / 20 + 0.5
		minetest.log("action", player:get_player_name() .. " is hungry and gets slower ("..(tmp*100).."% of speed)")
		player:set_physics_override({
			speed = tmp,
		})
		food.speed[player:get_player_name()] = tmp
	end
end

local function save_hunger()
	file = io.open(minetest:get_worldpath().."/hunger.txt", "w")
	if file then
		file:write(minetest.serialize(hunger))
		file:close()
	else
		minetest.log("error", "Can't save hunger")
	end
end

if not minetest.setting_getbool("creative_mode") then

minetest.register_globalstep(function(dtime)
	timer = timer+dtime
	if timer < 60 then
		return
	end
	timer = 0
	
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		if not hunger[name] then
			hunger[name] = 0
		end
		hunger[name] = hunger[name]+1
		
		update_player_hunger(player, hunger[name], false)
	end
	save_hunger()
end)

end -- not creative_mode

minetest.register_on_joinplayer(function(player)
	if not hunger[player:get_player_name()] then
		hunger[player:get_player_name()] = 0
		save_hunger()
	end
	minetest.after(1, update_player_hunger, player, hunger[player:get_player_name()], true)
	minetest.after(1, function(player)
		player:set_physics_override({
			sneak = false,
			sneak_glitch = false,
		})
	end, player)
	player:set_armor_groups({fleshy=100})
end)

minetest.register_on_respawnplayer(function(player)
	player:set_hp(10)
	hunger[player:get_player_name()] = 0
	update_player_hunger(player, 0, true)
end)

minetest.register_on_newplayer(function(player)
	player:set_hp(10)
end)

minetest.register_chatcommand("hunger", {
	params = "<name> | <name>, <hunger>",
	description = "Prints or sets hunger for player",
	privs = {give=true},
	func = function(name, param)
		local playername, playerhunger = string.match(param, "^([a-zA-Z0-9_%-]+) *([0-9]+)$")
		if not playerhunger then
			playername = param
		end
		local player = minetest.get_player_by_name(playername)
		if not player or not player:is_player() then
			minetest.chat_send_player(name, "Unkown player\""..playername.."\"")
			return
		end
		
		if tonumber(playerhunger) then
			hunger[playername] = tonumber(playerhunger)
			minetest.chat_send_player(name, "Hunger of "..playername.." set to "..hunger[playername])
			update_player_hunger(player, hunger[playername], true)
		else
			minetest.chat_send_player(name, "The hunger of "..playername.." is "..hunger[playername])
		end
	end,
})

--
-- Soil
--

minetest.register_node("food:soil", {
	description = "Soil",
	tiles = {"food_soil.png", "base_dirt.png"},
	stack_max = 20,
	drop = "base:dirt",
	is_ground_content = true,
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
	is_ground_content = true,
	groups = {crumbly=2, not_in_creative_inventory=1},
	sounds = {
		footstep = {name="base_footstep_dirt", gain=1.0},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
})

minetest.register_abm({
	nodenames = {"food:soil"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 10,
	action = function(pos, node)
		minetest.set_node(pos, {name="food:soil_wet"})
	end,
})

minetest.register_abm({
	nodenames = {"food:soil_wet"},
	interval = 2,
	chance = 30,
	action = function(pos, node)
		if not minetest.find_node_near(pos, 1, {"group:water"}) then
			minetest.set_node(pos, {name="food:soil"})
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
	if pt.under.y+1 ~= pt.above.y then
		return
	end
	
	local under = minetest.get_node(pt.under)
	if not minetest.registered_nodes[under.name] then
		return
	end
	
	if under.name ~= "base:dirt" and under.name ~= "base:grass" then
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
		{"base:copper", "base:copper"},
		{"", "group:wood"},
		{"", "group:wood"},
	}
})

minetest.register_craft({
	output = "food:hoe_iron",
	recipe = {
		{"base:iron", "base:iron"},
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
	tiles = {"food_pumpkin_top.png", "food_pumpkin_bottom.png", "food_pumpkin.png"},
	stack_max = 20,
	is_ground_content = true,
	groups = {choppy=3, plant=1},
	sounds = {
		footstep = {name="base_footstep_wood", gain=0.5},
		place = {name="base_place_hard", gain=1.0},
		dig = {name="base_dig_choppy", gain=0.5},
	},
	
	on_use = function(itemstack, user, pointed_thing)
		local hp = user:get_hp()
		local name = user:get_player_name()
		local playerhunger = hunger[name] or -1
		local used = false
		
		if hp > 0 and hp < 10 then
			user:set_hp(hp+1)
			minetest.log("action", name.." heals 1 hp")
			used = true
		end
			
		if playerhunger > 5 then
			hunger[name] = playerhunger - math.min(playerhunger, 10)
			save_hunger()
			update_player_hunger(user, hunger[name], true)
			used = true
		end
			
		if used and not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
			return itemstack
		else
			return itemstack
		end
	end,
})

minetest.register_abm({
	nodenames = {"food:pumpkin"},
	neighbors = {"food:soil_wet"},
	interval = 30,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y - 1
		local nu = minetest.get_node(pos).name
		if nu ~= "food:soil_wet" then
			return
		end
		
		local minp = {x=pos.x-2, y=pos.y-1, z=pos.z-2}
		local maxp = {x=pos.x+2, y=pos.y+3, z=pos.z+2}
		local soils = minetest.find_nodes_in_area(minp, maxp, {"food:soil_wet"})
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
	place_on   = "base:grass",
	sidelen    = 80,
	fill_ratio = 0.0005,
	biomes     = {"base_forest"},
	decoration = "food:pumpkin",
	height     = 1,
})

minetest.register_decoration({
	deco_type  = "simple",
	place_on   = "base:snowy_grass",
	sidelen    = 80,
	fill_ratio = 0.0005,
	biomes     = {"base_taiga"},
	decoration = "food:pumpkin",
	height     = 1,
})
