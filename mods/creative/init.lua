--[[
Nodetopia
Copyright (C) 2012 Perttu Ahola (celeron55) <celeron55@gmail.com>

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

creative_inventory = {}
creative_inventory.creative_inventory_size = 0

-- Create detached creative inventory after loading all mods
minetest.after(0, function()
	local inv = minetest.create_detached_inventory("creative", {
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			if minetest.setting_getbool("creative_mode") then
				return count
			else
				return 0
			end
		end,
		allow_put = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			if minetest.setting_getbool("creative_mode") then
				return -1
			else
				return 0
			end
		end,
		on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		end,
		on_put = function(inv, listname, index, stack, player)
		end,
		on_take = function(inv, listname, index, stack, player)
			stats.increase_stat(player, "creative_inv_taken", stack:get_count())
		end,
	})
	local creative_list = {}
	for name,def in pairs(minetest.registered_items) do
		if (not def.groups.not_in_creative_inventory or def.groups.not_in_creative_inventory == 0)
				and def.description and def.description ~= "" then
			table.insert(creative_list, name)
		end
	end

	table.sort(creative_list, function(a, b)
		-- a lower than b?
		local itema = minetest.registered_items[a]
		local itemb = minetest.registered_items[b]
		if itema.type == "node" and itemb.type == "node" then
			return a < b
		elseif itema.type == "tool" and itemb.type == "tool" then
			return a < b
		else
			return (itema.type == "node")
		end
	end)

	inv:set_size("main", #creative_list)
	for _,itemstring in ipairs(creative_list) do
		inv:add_item("main", ItemStack(itemstring))
	end
	creative_inventory.creative_inventory_size = #creative_list
end)

-- Create the trash field
local trash = minetest.create_detached_inventory("creative_trash", {
	-- Allow the stack to be placed and remove it in on_put()
	-- This allows the creative inventory to restore the stack
	allow_put = function(inv, listname, index, stack, player)
		if minetest.setting_getbool("creative_mode") then
			return stack:get_count()
		else
			return 0
		end
	end,
	on_put = function(inv, listname, index, stack, player)
		stats.increase_stat(player, "creative_inv_trashed", stack:get_count())
		inv:set_stack(listname, index, "")
	end,
})
trash:set_size("main", 1)


creative_inventory.set_creative_formspec = function(player, start_i, pagenum)
	pagenum = math.floor(pagenum)
	local pagemax = math.floor((creative_inventory.creative_inventory_size-1) / (6*4) + 1)
	player:set_inventory_formspec(
			"size[13,7.5]"..
			"list[current_player;main;5,3.5;8,4;]"..
			"list[current_player;craft;8,0;3,3;]"..
			"list[current_player;craftpreview;12,1;1,1;]"..
			"list[detached:creative;main;0.3,0.5;4,6;"..tostring(start_i).."]"..
			"label[2.0,6.55;"..tostring(pagenum).."/"..tostring(pagemax).."]"..
			"button[0.3,6.5;1.6,1;creative_prev;<<]"..
			"button[2.7,6.5;1.6,1;creative_next;>>]"..
			"label[5,1.5;Trash:]"..
			"list[detached:creative_trash;main;5,2;1,1;]"..
			
			"listcolors[#0000;#FFF3]"..
			"bgcolor[#000000A0;true]"..
			"background[-0.0625,-0.0625;13.125,7.625;creative_formspec_background.png]"..
			"background[0,0;13,7.5;creative_formspec_inventory.png]"
	)
end
minetest.register_on_joinplayer(function(player)
	-- If in creative mode, modify player's inventory forms
	if not minetest.setting_getbool("creative_mode") then
		return
	end
	creative_inventory.set_creative_formspec(player, 0, 1)
end)
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if not minetest.setting_getbool("creative_mode") then
		return
	end
	-- Figure out current page from formspec
	local current_page = 0
	local formspec = player:get_inventory_formspec()
	local start_i = string.match(formspec, "list%[detached:creative;main;[%d.]+,[%d.]+;[%d.]+,[%d.]+;(%d+)%]")
	start_i = tonumber(start_i) or 0

	if fields.creative_prev then
		start_i = start_i - 4*6
	end
	if fields.creative_next then
		start_i = start_i + 4*6
	end

	if start_i < 0 then
		start_i = start_i + 4*6
	end
	if start_i >= creative_inventory.creative_inventory_size then
		start_i = start_i - 4*6
	end
		
	if start_i < 0 or start_i >= creative_inventory.creative_inventory_size then
		start_i = 0
	end

	creative_inventory.set_creative_formspec(player, start_i, start_i / (6*4) + 1)
end)

if minetest.setting_getbool("creative_mode") then
	
	minetest.register_item(":", {
		type = "none",
		wield_image = "base_hand.png",
		wield_scale = {x=1,y=1,z=1.5},
		range = 10,
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
				cracky = {times={[1]=0.0, [2]=0.0, [3]=0.0, [4]=0.0}, uses=0, maxlevel=3},
				snappy = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
				choppy = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
				liquid = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
				oddly_breakable_by_hand = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
			},
			damage_groups = {fleshy = 10},
		}
	})
	
	minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
		return true
	end)
	
	function minetest.handle_node_drops(pos, drops, digger)
		if not digger or not digger:is_player() then
			return
		end
		local inv = digger:get_inventory()
		if inv then
			for _,item in ipairs(drops) do
				item = ItemStack(item):get_name()
				if not inv:contains_item("main", item) then
					inv:add_item("main", item)
				end
			end
		end
	end
	
	stats.register_stat( {
		name = "creative_inv_taken",
		description = function(value)
			return " - Items taken from creative inventory: "..value
		end,
	})
	
	stats.register_stat( {
		name = "creative_inv_trashed",
		description = function(value)
			return " - Items trashed in creative inventory: "..value
		end,
	})
	
end
