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

local armor = {}

local function get_armor_from_item(name, part)
	local def = minetest.registered_items[name]
	if (not def) or (not def.armor) then
		return 0
	else
		if part == def.armor.part then
			return def.armor.amount
		else
			return 0
		end
	end
end

local enable_3d_models = minetest.setting_getbool("enable_3d_models")
if enable_3d_models == nil then
	enable_3d_models = true
end

local function get_armor_overlay_from_item(name, part)
	local def = minetest.registered_items[name]
	if (not def) or (not def.armor) then
		return "", ""
	else
		if enable_3d_models then
			if def.armor.overlay and part == def.armor.part then
				return def.armor.overlay, ""
			else
				return "", ""
			end
		else
			if def.armor.overlay_2d_front and def.armor.overlay_2d_back and part == def.armor.part then
				return def.armor.overlay_2d_front, def.armor.overlay_2d_back
			else
				return "", ""
			end
		end
	end
end

local function get_armor(player)
	inv = player:get_inventory()
	local armor = 0
	for _,name in ipairs({"helmet", "body_armor", "glove_left", "glove_right", "boot_left", "boot_right"}) do
		local part = name
		if string.sub(name, 1, 5) == "glove" then
			part = "glove"
		elseif string.sub(name, 1, 4) == "boot" then
			part = "boot"
		end
		armor = armor + get_armor_from_item(inv:get_stack(name, 1):get_name(), part)
	end
	return armor
end

local hud_ids = {}

local function update_armor(player, new_armor)
	local inv = player:get_inventory()
	local pname = player:get_player_name()
	armor[pname].armor = new_armor
	
	new_armor = math.min(new_armor, 75)
	player:set_armor_groups({fleshy=100-new_armor})
	
	local textures = {"models_player.png"}
	if not enable_3d_models then
		textures = {"models_player_2d.png", "models_player_2d_back.png"}
	end
	
	for name,value in pairs(armor[pname]) do
		if name ~= "armor" then
			armor[pname][name] = inv:get_stack(name, 1):get_name()
			
			-- set overlay for model
			if armor[pname][name] ~= "" then
				local part = name
				if string.sub(name, 1, 5) == "glove" then
					part = "glove"
				elseif string.sub(name, 1, 4) == "boot" then
					part = "boot"
				end
				local overlay_front, overlay_back = get_armor_overlay_from_item(armor[pname][name], part)
				if overlay_front ~= "" then
					textures[1] = textures[1] .. "^" .. overlay_front
					print (overlay_front)
					print(textures[1])
				end
				if overlay_back ~= "" then
					textures[2] = textures[2] .. "^" .. overlay_back
				end
			end
		end
	end
	
	player:set_properties({
		textures = textures,
	})
	
	if armor[pname].helmet ~= "" then
		hud_ids[pname] = player:hud_add({
			hud_elem_type = "image",
			text = "armor_hud_helmet.png",
			name = "armor_hud_helmet",
			scale = {x=-100, y=-100},
			position = {x=0, y=0},
			alignment = {x=1, y=1},
		})
	elseif hud_ids[pname] ~= -1337 then
		player:hud_remove(hud_ids[pname])
		hud_ids[pname] = -1337
	end
end

minetest.register_on_joinplayer(function(player)
	hud_ids[player:get_player_name()] = -1337
	armor[player:get_player_name()] = {
		armor = 0,
		helmet = "",
		body_armor = "",
		glove_left = "",
		glove_right = "",
		boot_left = "",
		boot_right = "",
	}
	minetest.after(1, function(player)
		update_armor(player, get_armor(player))
	end, player)
end)

-- No on_move in player inventory, so we use this HACK
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer < 2 then
		return
	end
	timer = 0
	
	for _,player in ipairs(minetest.get_connected_players()) do
		local pname = player:get_player_name()
		local inv = player:get_inventory()
		for name,value in pairs(armor[pname]) do
			if name ~= "armor" then
				if value ~= inv:get_stack(name, 1):get_name() then
					update_armor(player, get_armor(player))
				end
			end
		end
	end
end)

--
-- Armor
--

minetest.register_craftitem("armor:body_armor_iron", {
	description = "Iron Body Armor",
	inventory_image = "armor_body_armor_iron.png",
	stack_max = 1,
	armor = {
		part = "body_armor",
		amount = 15,
		overlay_2d_front = "armor_body_armor_iron_overlay_2d.png",
		overlay_2d_back = "armor_body_armor_iron_overlay_2d.png",
		overlay = "armor_body_armor_iron_overlay.png",
	},
})

minetest.register_craftitem("armor:helmet_iron", {
	description = "Iron Helmet",
	inventory_image = "armor_helmet_iron.png",
	stack_max = 1,
	armor = {
		part = "helmet",
		amount = 10,
		overlay_2d_back = "armor_helmet_iron_overlay_2d_back.png",
		overlay_2d_front = "armor_helmet_iron_overlay_2d_front.png",
		overlay = "armor_helmet_iron_overlay.png",
	},
})

minetest.register_craftitem("armor:glove_iron", {
	description = "Iron Glove",
	inventory_image = "armor_glove_iron.png",
	stack_max = 1,
	armor = {
		part = "glove",
		amount = 7,
		overlay_2d_front = "armor_glove_iron_overlay_2d.png",
		overlay_2d_back = "armor_glove_iron_overlay_2d.png",
		overlay = "armor_glove_iron_overlay.png",
	},
})

minetest.register_craftitem("armor:boot_iron", {
	description = "Iron Boot",
	inventory_image = "armor_boot_iron.png",
	stack_max = 1,
	armor = {
		part = "boot",
		amount = 8,
		overlay_2d_front = "armor_boot_iron_overlay_2d.png",
		overlay_2d_back = "armor_boot_iron_overlay_2d.png",
		overlay = "armor_boot_iron_overlay.png",
	},
})

--
-- Crafts
--

minetest.register_craft({
	output = "armor:body_armor_iron",
	recipe = {
		{"base:iron", "", "base:iron"},
		{"base:iron", "base:iron", "base:iron"},
		{"base:iron", "base:iron", "base:iron"},
	}
})

minetest.register_craft({
	output = "armor:helmet_iron",
	recipe = {
		{"base:iron", "base:iron", "base:iron"},
		{"base:iron", "", "base:iron"},
	}
})

minetest.register_craft({
	output = "armor:glove_iron",
	recipe = {
		{"base:iron"},
		{"base:iron"},
	}
})

minetest.register_craft({
	output = "armor:boot_iron",
	recipe = {
		{"base:iron", ""},
		{"base:iron", "base:iron"},
	}
})
