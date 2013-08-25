
minetest.register_on_joinplayer(function(player)
	if not minetest.setting_getbool("creative_mode") then
		minetest.after(0, player.hud_set_hotbar_itemcount, player, 5)
		player:set_inventory_formspec(
			"size[5,1;]"..
			"list[current_player;main;0,0;5,1;]"
		)
		player:get_inventory():set_size("main", 5)
		player:get_inventory():set_size("backpack", 5*4)
	else
		player:get_inventory():set_size("main", 8*4)
	end
end)


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
	groups = {dig_immediate=2},
	
	on_dig = function(pos, node, digger)
		local inv = digger:get_inventory()
		local meta = minetest.get_meta(pos)
		local stack = {name="backpack:backpack", metadata=meta:get_string("owner")}
		-- 5 is preferred position
		if inv:get_stack("main", 5):is_empty() then
			inv:set_stack("main", 5, stack)
		else
			inv:add_item("main", stack)
		end
		minetest.node_dig(pos, node, digger)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[5,8.5]"..
			"list[current_player;main;0,3.5;5,1;]"..
			"list[current_player;backpack;0,4.5;5,4;]"..
			"list[current_player;craft;0.5,0;3,3;]"..
			"list[current_player;craftpreview;3.5,1;1,1;]"
		)
	end,
	after_place_node = function(pos, placer, itemstack)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", itemstack:get_metadata().."'s Backpack")
		meta:set_string("owner", itemstack:get_metadata()) -- not needed yet
	end,
})
