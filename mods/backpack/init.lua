--[[
Pilztest
Copyright (C) 2013  PilzAdam

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

minetest.register_on_joinplayer(function(player)
	if not minetest.setting_getbool("creative_mode") then
		minetest.after(0, player.hud_set_hotbar_itemcount, player, 5)
		minetest.after(0, player.hud_set_hotbar_image, player, "backpack_hotbar_5.png")
		minetest.after(0, player.hud_set_hotbar_selected_image, player, "backpack_hotbar_selected.png")
		player:set_inventory_formspec(
			"size[5,1;]"..
			"list[current_player;main;0,0;5,1;]"..
			
			"listcolors[#0000;#FFF3]"..
			"bgcolor[#000000A0;true]"..
			"background[-0.0625,-0.0625;5.125,1.125;backpack_inventory_background.png]"..
			"background[0,0;5,1;backpack_inventory.png]"
		)
		player:get_inventory():set_size("main", 5)
		player:get_inventory():set_size("backpack", 5*4)
	else
		minetest.after(0, player.hud_set_hotbar_image, player, "backpack_hotbar_8.png")
		minetest.after(0, player.hud_set_hotbar_selected_image, player, "backpack_hotbar_selected.png")
		player:get_inventory():set_size("main", 8*4)
	end
end)

minetest.register_chatcommand("givebackpack", {
	params = "<name> | <none>",
	description = "Gives player a new backpack",
	privs = {give=true},
	func = function(name, param)
		local playername = param
		if playername == "" then
			playername = name
		end
		local player = minetest.get_player_by_name(playername)
		if not player or not player:is_player() then
			minetest.chat_send_player(name, "Unkown player\""..playername.."\"")
			return
		end
		
		local inv = player:get_inventory()
		local stack = {name="backpack:backpack", metadata=playername}
		if inv:get_stack("main", 5):is_empty() then
			inv:set_stack("main", 5, stack)
		else
			inv:add_item("main", stack)
		end
	end,
})

minetest.register_on_newplayer(function(player)
	local inv = player:get_inventory()
	inv:set_stack("main", 5, {name="backpack:backpack", metadata=player:get_player_name()})
end)

minetest.register_node("backpack:backpack", {
	description = "Backpack",
	tiles = {
		"backpack_top.png",
		"backpack_side.png",
		"backpack_side.png",
		"backpack_side.png",
		"backpack_back.png",
		"backpack_front.png"
	},
	paramtype2 = "facedir",
	stack_max = 1,
	drop = "",
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	
	on_dig = function(pos, node, digger)
		local inv = digger:get_inventory()
		local meta = minetest.get_meta(pos)
		local stack = {name="backpack:backpack", metadata=meta:get_string("owner")}
		-- 5 is preferred position
		if inv:get_stack("main", 5):is_empty() then
			inv:set_stack("main", 5, stack)
		else
			minetest.handle_node_drops(pos, {stack}, digger)
		end
		minetest.node_dig(pos, node, digger)
	end,
	after_place_node = function(pos, placer, itemstack)
		local meta = minetest.get_meta(pos)
		local name = itemstack:get_metadata()
		meta:set_string("infotext", name.."'s Backpack")
		meta:set_string("owner", name)
		meta:set_string("formspec",
			"size[5,8.5]"..
			"list[current_player;main;0,3.5;5,1;]"..
			"list[player:"..name..";backpack;0,4.5;5,4;]"..
			"list[current_player;craft;0.5,0;3,3;]"..
			"list[current_player;craftpreview;3.5,1;1,1;]"..
			
			"listcolors[#0000;#FFF3]"..
			"bgcolor[#000000A0;true]"..
			"background[-0.0625,-0.0625;5.125,8.625;backpack_formspec_background.png]"..
			"background[0,3.5;5,1;backpack_inventory.png]"..
			"background[0,4.5;5,4;backpack_formspec_inventory.png]"..
			"background[0.5,0;4,3;backpack_formspec_craft.png]"
		)
	end,
})
