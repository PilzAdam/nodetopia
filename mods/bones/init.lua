-- Minetest 0.4 mod: bones
-- See README.txt for licensing and other information. 

minetest.register_node("bones:bones", {
	description = "Bones",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"bones_front.png"
	},
	paramtype2 = "facedir",
	groups = {dig_immediate=2},
	sounds = {
		footstep = {name="deco_footstep_gravel", gain=0.5},
		place = {name="base_place", gain=1.0},
		dig = {name="base_dig_crumbly", gain=0.5},
	},
	
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		return count
	end,
	
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
	
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		return stack:get_count()
	end,
	
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if meta:get_inventory():is_empty("main") then
			meta:set_string("formspec", "")
		end
	end,
})

minetest.register_on_dieplayer(function(player)
	if minetest.setting_getbool("creative_mode") then
		return
	end
	
	local pos = player:getpos()
	pos.x = math.floor(pos.x+0.5)
	pos.y = math.floor(pos.y+0.5)
	pos.z = math.floor(pos.z+0.5)
	local param2 = minetest.dir_to_facedir(player:get_look_dir())
	
	local nn = minetest.get_node(pos).name
	if minetest.registered_nodes[nn].can_dig and
		not minetest.registered_nodes[nn].can_dig(pos, player) then
		local player_inv = player:get_inventory()

		for i=1,player_inv:get_size("main") do
			player_inv:set_stack("main", i, nil)
		end
		for i=1,player_inv:get_size("craft") do
			player_inv:set_stack("craft", i, nil)
		end
		return
	end
	
	minetest.dig_node(pos)
	minetest.add_node(pos, {name="bones:bones", param2=param2})
	
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local player_inv = player:get_inventory()
	inv:set_size("main", 5)
	
	local empty_list = inv:get_list("main")
	inv:set_list("main", player_inv:get_list("main"))
	player_inv:set_list("main", empty_list)
	
	meta:set_string("formspec", "size[5,2.5;]"..
			"list[current_name;main;0,0;5,1;]"..
			"list[current_player;main;0,1.5;5,1;]")
	meta:set_string("infotext", player:get_player_name().."'s bones")
end)
