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

local next_id = 0

minetest.register_entity("mobs:stone_monster", {
	initial_properties = {
		hp_max = 100,
		physical = true,
		collide_with_objects = true,
		collisionbox = {-0.3, -1.0, -0.3,  0.3, 1.0, 0.3},
		visual = "mesh",
		mesh = "models_player.b3d",
		visual_size = {x=10/16, y=20/32},
		textures = {"mobs_stone_monster.png"},
		is_visible = true,
		makes_footstep_sound = true,
		stepheight = 1.1,
		automatic_face_movement_dir = 270,
	},
	
	attack = "",
	state = "stand",
	velocity = {x=0, y=0, z=0},
	timer = 0,
	
	attack_speed = 3.5,
	walk_speed = 1.0,
	damage = 1,
	
	id = -1,
	
	anim = {
		ArmLeft = {pos={x=0.54, y=1, z=0}, rot={x=0, y=0, z=0}, dir=0, speed=30*5, lim={30, -30}},
		ArmRight = {pos={x=-0.51, y=1, z=0}, rot={x=0, y=0, z=0}, dir=0, speed=30*5, lim={30, -30}},
		LegLeft = {pos={x=0.19, y=0, z=0}, rot={x=0, y=0, z=0}, dir=0, speed=40*5, lim={40, -40}},
	},
	punched = false,
	
	debug = function(self, str)
		--minetest.log("action", "mob "..self.id..": "..str)
	end,
	
	debug_t = function(self, func, t1)
		local delta = os.clock() - t1
		if delta == 0 then
			return
		end
		--minetest.log("action", "mob "..self.id..": "..func..string.format(" took %.2fms", delta * 1000))
	end,
	
	update_animation = function(self, dtime)
		local t1 = os.clock()
		local obj = self.object
		
		-- Calc changes in dir
		local v = vector.length(obj:getvelocity())
		local pitch = 0--player:get_look_pitch()*180/math.pi
		if self.attack ~= "" then
			local player = minetest.get_player_by_name(self.attack)
			local pp = player:getpos()
			pp.y = pp.y + 1.5
			local sp = obj:getpos()
			sp.y = sp.y + 0.5
			local vec = {x=pp.x-sp.x, y=pp.y-sp.y, z=pp.z-sp.z}
			pitch = math.asin(vec.y/vector.length(vec))*180/math.pi
		end
		if pitch > 50 then pitch = 50 end
		if pitch < -70 then pitch = -70 end
		
		if v > 0.1 then
			if self.anim.ArmLeft.dir == 0 then
				self.anim.ArmLeft.dir = -1
			end
			if self.anim.ArmRight.dir == 0 then
				self.anim.ArmRight.dir = 1
			end
			if self.anim.LegLeft.dir == 0 then
				self.anim.LegLeft.dir = 1
			end
		else
			self.anim.ArmLeft.dir = 0
			self.anim.ArmRight.dir = 0
			self.anim.LegLeft.dir = 0
			v = 2
		end
		
		self.anim.ArmLeft.speed = 30*5 * v/4
		self.anim.ArmLeft.lim = {30 - (4-v)*7, -30 + (4-v)*7}
		self.anim.LegLeft.speed = 40*5 * v/4
		self.anim.LegLeft.lim = {40 - (4-v)*7, -40 + (4-v)*7}
		
		if self.punched then
			self.anim.ArmRight.rot.x = 90
			self.punched = false
		end
		
		if math.abs(-self.anim.ArmLeft.rot.x - self.anim.ArmRight.rot.x) > 15 then
			self.anim.ArmRight.speed = 30*10
			self.anim.ArmRight.lim = {-self.anim.ArmLeft.rot.x+1, -self.anim.ArmLeft.rot.x-1}
		else
			self.anim.ArmRight.speed = 30*5 * v/4
			self.anim.ArmRight.lim = {30 - (4-v)*7, -30 + (4-v)*7}
		end
		
		-- Calc new rotation
		for bone,tab in pairs(self.anim) do
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
		
		-- apply it
		for bone,tab in pairs(self.anim) do
			obj:set_bone_position(bone, tab.pos, tab.rot)
			if bone == "LegLeft" then
				local rot = {x=tab.rot.x, y=tab.rot.y, z=tab.rot.z}
				rot.x = -rot.x
				obj:set_bone_position("LegRight", {x=-0.19, y=0, z=0}, rot)
			end
		end
		obj:set_bone_position("Body",{x=0,y=0,z=0}, {x=180,y=0,z=180})
		obj:set_bone_position("Head", vector.new(0,1,0), vector.new(pitch,0,0))
		self:debug_t("update_animation()", t1)
	end,
	
	set_velocity = function(self, dir, velocity)
		self.velocity.x = math.sin(dir) * -velocity
		self.velocity.z = math.cos(dir) * velocity
	end,
	
	on_activate = function(self, staticdata, dtime_s)
		self:debug("on_activate()")
		local t1 = os.clock()
		if staticdata == "not_first_activation" then
			local objects = minetest.get_objects_inside_radius(self.object:getpos(), 10)
			local remove = true
			local obj
			if #objects < 40 then
				for _,obj in ipairs(objects) do
					if obj:is_player() then
						self:debug("on_activate(): not removing self: player nearby")
						remove = false
						break
					end
				end
			end
			if remove then
				self:debug("on_activate(): removing self")
				self.object:remove()
				return
			end
		end
		self.object:set_armor_groups({cracky=100})
		self.object:setacceleration({x=0, y=-9.81, z=0})
		self.id = next_id
		next_id = next_id+1
		self:debug_t("on_activate()", t1)
	end,
	
	on_step = function(self, dtime)
		local t1 = os.clock()
		if self.attack ~= "" then
			local player = minetest.get_player_by_name(self.attack)
			if not player then
				self:debug("on_step(): player not found")
				self.attack = ""
				self:update_animation(dtime)
				self:debug_t("step()", t1)
				return
			end
			if player:get_hp() <= 0 then
				self:debug("on_step(): player is dead")
				self.attack = ""
				self:update_animation(dtime)
				self:debug_t("step()", t1)
				return
			end
			
			local pp = player:getpos()
			pp.y = pp.y+1.5
			local sp = self.object:getpos()
			sp.y = sp.y+0.5
			local vec = {x=pp.x-sp.x, y=pp.y-sp.y, z=pp.z-sp.z}
			pp.y = pp.y-1.5
			local dist2 = math.sqrt(vec.x^2 + vec.z^2)
			local dist3 = math.sqrt(vec.x^2 + vec.z^2 + vec.y^2)
			local yaw = math.atan2(-vec.x, vec.z)
			
			if dist3 > 20 then
				self:debug("on_step(): stop attacking "..self.attack)
				self.attack = ""
			elseif dist2 > 1.5 then
				self:set_velocity(yaw, self.attack_speed)
			else
				self:set_velocity(yaw, 0)
				self.object:setyaw(yaw)
			end
			
			if dist3 <= 2.5 then
				self:set_velocity(yaw, 0)
				self.object:setyaw(yaw)
				local i
				for i=0, 2, 0.5 do
					pp.y = pp.y+i
					if minetest.line_of_sight(sp, pp, 0.1) then
						if self.timer < 1 then
							self.timer = self.timer + dtime
						end
						if self.timer >= 1 then
							self:debug("on_step(): punching "..self.attack)
							player:punch(self.object, 1.0, {damage_groups={fleshy=self.damage}})
							self.timer = 0
							self.punched = true
						end
						break
					end
					pp.y = pp.y-i
				end
			end
		else
			if self.state == "stand" then
				
				self.velocity = {x=0, y=0, z=0}
				
				if math.random(1, 100) == 1 then
					self:debug("on_step(): changing state from stand to walk")
					self.state = "walk"
					self:set_velocity(self.object:getyaw(), self.walk_speed)
				end
				
			elseif self.state == "walk" then
				
				local yaw = self.object:getyaw()
				local v1 = self.object:getvelocity()
				local v2 = self.velocity
				if math.abs(v1.x - v2.x) > 0.5 or math.abs(v1.z - v2.z) > 0.5 then
					self:debug("on_step(): not moving in desired direction; change yaw")
					yaw = yaw + math.pi + (math.abs(-45, 45)/180*math.pi)
				elseif math.random(1, 100) == 1 then
					self:debug("on_step(): changing yaw while walking")
					yaw = yaw + math.random(-90, 90) / 180 * math.pi
				end
				self:set_velocity(yaw, self.walk_speed)
				
				if math.random(1, 400) == 1 then
					self:debug("on_step(): changing state from walk to stand")
					self.state = "stand"
					self.velocity = {x=0, y=0, z=0}
				end
				
			end
			
			if minetest.setting_getbool("enable_damage") then
				local player, _
				for _,player in ipairs(minetest.get_connected_players()) do
					if player:get_hp() > 0 then
						local pp = player:getpos()
						pp.y = pp.y + 1
						local sp = self.object:getpos()
						sp.y = sp.y + 0.5
						local vec = {x=pp.x-sp.x, y=pp.y-sp.y, z=pp.z-sp.z}
						local dist = math.sqrt(vec.x^2 + vec.z^2)
						if dist < 3 or (dist < 15 and minetest.line_of_sight(sp, pp, 0.5)) then
							self:debug("on_step(): attacking "..player:get_player_name())
							self.attack = player:get_player_name()
						end
					end
				end
			end
		end
		
		self.object:setvelocity({x=self.velocity.x, y=self.object:getvelocity().y, z=self.velocity.z})
		self:debug_t("step()", t1)
		self:update_animation(dtime)
	end,
	
	on_punch = function(self, hitter)
		local t1 = os.clock()
		self:debug("on_punch()")
		if not hitter then
			return
		end
		local tool = hitter:get_wielded_item()
		local def = tool:get_definition()
		if def and def.tool_capabilities and def.tool_capabilities.groupcaps and def.tool_capabilities.groupcaps.cracky then
			local uses = def.tool_capabilities.groupcaps.cracky.uses
			if uses then
				minetest.sound_play("base_dig_cracky", {
					object = self.object,
					gain = 0.5,
				})
				if not minetest.setting_getbool("creative_mode") then
					self:debug("on_punch(): wearing out tool")
					tool:add_wear(65535/(uses*3))
					hitter:set_wielded_item(tool)
				end
			end
		end
		
		if hitter:is_player() then
			self:debug("on_punch(): attacking "..hitter:get_player_name())
			self.attack = hitter:get_player_name()
		end
		self:debug_t("on_punch()", t1)
	end,
	
	on_rightclick = function(self, clicker)
		
	end,
	
	get_staticdata = function(self)
		return "not_first_activation"
	end,
})

local debug = function(str)
	--minetest.log("action", str)
end

debug_t = function(t1)
	local delta = os.clock() - t1
	if delta == 0 then
		return
	end
	--minetest.log("action", "spawn abm took "..string.format("%.2fms", delta * 1000))
end,

minetest.register_abm({
	nodenames = {"base:stone"},
	neighbors = {"air"},
	interval = 15,
	chance = 16000,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local t1 = os.clock()
		if active_object_count > 40 then
			debug("spawn abm: too many objects")
			debug_t(t1)
			return
		end
		pos.y = pos.y+2
		if minetest.get_node(pos).name ~= "air" then
			debug("spawn abm: not enough air")
			debug_t(t1)
			return
		end
		pos.y = pos.y-1
		if minetest.get_node(pos).name ~= "air" then
			debug("spawn abm: not enough air")
			debug_t(t1)
			return
		end
		if minetest.get_node_light(pos) > 2 then
			debug("spawn abm: too bright")
			debug_t(t1)
			return
		end
		local num_objects = 0
		local _,obj
		local players = {}
		for _,obj in ipairs(minetest.get_objects_inside_radius(pos, 16)) do
			if obj.get_luaentity and obj:get_luaentity() and obj:get_luaentity().name == "mobs:stone_monster" then
				num_objects = num_objects+1
			end
			if obj:is_player() then
				table.insert(players, obj)
			end
		end
		debug("spawn abm: num_objects="..num_objects)
		if num_objects > 3 then
			debug("spawn abm: too many mobs")
			debug_t(t1)
			return
		end
		
		local player
		for _,player in ipairs(players) do
			local pp = player:getpos()
			local vec = {x=pp.x-pos.x, y=pp.y-pos.y, z=pp.z-pos.z}
			local dist = math.sqrt(vec.x^2 + vec.y^2 + vec.z^2)
			if dist > 8 then
				debug("spawn abm: player too close")
				debug_t(t1)
				return
			end
		end
		
		debug("spawn abm: SPAWNING stone_monster at "..minetest.pos_to_string(pos))
		minetest.add_entity(pos, "mobs:stone_monster")
		debug_t(t1)
	end,
})
