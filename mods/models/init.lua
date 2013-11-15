
minetest.register_on_joinplayer(function(player)
	player:set_properties({
		mesh = "models_player.b3d",
		textures = {"models_player.png"},
		visual = "mesh",
		visual_size = {x=10/16, y=20/32},
	})
end)

local players = {
	--[[
		[name] = {
			ArmLeft  = {pos, rot, dir, lim, speed},
			ArmRight = {pos, rot, dir, lim, speed},
			LegLeft  = {pos, rot, dir, lim, speed},
			place = bool,
		}
	]]
}

local placed = {
	-- [name] = bool
}

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
	placed[placer:get_player_name()] = true
end)

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		
		-- init
		if not players[name] then
			players[name] = {
				ArmLeft = {pos={x=0.54, y=1, z=0}, rot={x=0, y=0, z=0}, dir=0, speed=30*5, lim={30, -30}},
				ArmRight = {pos={x=-0.51, y=1, z=0}, rot={x=0, y=0, z=0}, dir=0, speed=30*5, lim={30, -30}},
				LegLeft = {pos={x=0.19, y=0, z=0}, rot={x=0, y=0, z=0}, dir=0, speed=40*5, lim={40, -40}},
			}
		end
		
		-- Calc changes in dir
		local c = player:get_player_control()
		local walk = c.up or c.down or c.left or c.right
		local dig = c.LMB
		local sneak = c.sneak
		local pitch = player:get_look_pitch()*180/math.pi
		if pitch > 50 then pitch = 50 end
		if pitch < -70 then pitch = -70 end
		local player_speed = food.speed[name] or 1
		
		if walk then
			if players[name].ArmLeft.dir == 0 then
				players[name].ArmLeft.dir = -1
			end
			if not dig and players[name].ArmRight.dir == 0 then
				players[name].ArmRight.dir = 1
			end
			if players[name].LegLeft.dir == 0 then
				players[name].LegLeft.dir = 1
			end
		else
			players[name].ArmLeft.dir = 0
			if not dig then
				players[name].ArmRight.dir = 0
			end
			players[name].LegLeft.dir = 0
		end
		
		if sneak then
			players[name].ArmLeft.speed = 20*2 * player_speed
			players[name].ArmLeft.lim = {20, -20}
			players[name].LegLeft.speed = 30*2 * player_speed
			players[name].LegLeft.lim = {30, -30}
		else
			players[name].ArmLeft.speed = 30*5 * player_speed
			players[name].ArmLeft.lim = {30, -30}
			players[name].LegLeft.speed = 40*5 * player_speed
			players[name].LegLeft.lim = {40, -40}
		end
		
		if placed[name] then
			players[name].ArmRight.rot.x = pitch+90
			placed[name] = false
		end
		
		if dig then
			players[name].ArmRight.speed = 20*20
			players[name].ArmRight.lim = {100+pitch, 60+pitch}
			if players[name].ArmRight.dir == 0 then
				players[name].ArmRight.dir = 1
			end
		else
			if math.abs(-players[name].ArmLeft.rot.x - players[name].ArmRight.rot.x) > 15 then
				players[name].ArmRight.speed = 30*10
				players[name].ArmRight.lim = {-players[name].ArmLeft.rot.x+1, -players[name].ArmLeft.rot.x-1}
			elseif sneak then
				players[name].ArmRight.speed = 20*2 * player_speed
				players[name].ArmRight.lim = {20, -20}
			else
				players[name].ArmRight.speed = 30*5 * player_speed
				players[name].ArmRight.lim = {30, -30}
			end
		end
		
		-- Calc new rotation
		for bone,tab in pairs(players[name]) do
			if tab.dir == -1 then
				tab.rot.x = tab.rot.x - tab.speed*dtime
				if tab.rot.x < tab.lim[2] then
					tab.dir = 1
				end
			elseif tab.dir == 1 then
				tab.rot.x = tab.rot.x + tab.speed*dtime
				if tab.rot.x > tab.lim[1] then
					tab.dir = -1
				end
			else
				if tab.rot.x < 0 then
					tab.rot.x = tab.rot.x + tab.speed*dtime
					if tab.rot.x > 0 then
						tab.rot.x = 0
					end
				elseif tab.rot.x > 0 then
					tab.rot.x = tab.rot.x - tab.speed*dtime
					if tab.rot.x < 0 then
						tab.rot.x = 0
					end
				end
			end
		end
		
		-- Apply it
		for bone,tab in pairs(players[name]) do
			player:set_bone_position(bone, tab.pos, tab.rot)
			if bone == "LegLeft" then
				local rot = {x=tab.rot.x, y=tab.rot.y, z=tab.rot.z}
				rot.x = -rot.x
				player:set_bone_position("LegRight", {x=-0.19, y=0, z=0}, rot)
			end
		end
		local factor = 1
		if c.down and not c.up then
			factor = -1
		end
		if c.left and not c.right then
			player:set_bone_position("Body",{x=0,y=0,z=0}, {x=180,y=30*factor,z=180})
		elseif c.right and not c.left then
			player:set_bone_position("Body",{x=0,y=0,z=0}, {x=180,y=-30*factor,z=180})
		else
			player:set_bone_position("Body",{x=0,y=0,z=0}, {x=180,y=0,z=180})
		end
		
		
		-- apply head rotation
		if c.left and not c.right then
			player:set_bone_position("Head", vector.new(0,1,0), vector.new(pitch,30*factor,0))
		elseif c.right and not c.left then
			player:set_bone_position("Head", vector.new(0,1,0), vector.new(pitch,-30*factor,0))
		else
			player:set_bone_position("Head", vector.new(0,1,0), vector.new(pitch,0,0))
		end
	end
end)
