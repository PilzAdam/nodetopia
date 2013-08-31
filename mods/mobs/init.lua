
local debug = function(...)
	--print("mobs:", ...)
end

minetest.register_entity("mobs:stone_monster", {
	initial_properties = {
		hp_max = 100,
		physical = true,
		collide_with_objects = true,
		collisionbox = {-0.3, -1.0, -0.3,  0.3, 1.0, 0.3},
		visual = "upright_sprite",
		visual_size = {x=1, y=2},
		textures = {"mobs_stone_monster.png", "mobs_stone_monster_back.png"},
		is_visible = true,
		makes_footstep_sound = true,
		stepheight = 1.1,
	},
	
	attack = "",
	state = "stand",
	velocity = {x=0, y=0, z=0},
	timer = 0,
	
	attack_speed = 3.5,
	walk_speed = 1.0,
	damage = 2,
	
	set_velocity = function(self, dir, velocity)
		self.velocity.x = math.sin(dir) * -velocity;
		self.velocity.z = math.cos(dir) * velocity;
	end,
	
	on_activate = function(self, staticdata, dtime_s)
		debug("on_activate()")
		self.object:set_armor_groups({cracky=100})
		self.object:setacceleration({x=0, y=-9.81, z=0})
	end,
	
	on_step = function(self, dtime)
		if self.timer > 0 then
			self.timer = self.timer - dtime
		end
		
		if self.attack ~= "" then
			local player = minetest.get_player_by_name(self.attack)
			if not player then
				debug("on_step(): player not found")
				self.attack = ""
				return
			end
			if player:get_hp() <= 0 then
				debug("on_step(): player is dead")
				self.attack = ""
				return
			end
			
			local pp = player:getpos()
			pp.y = pp.y+1
			local sp = self.object:getpos()
			sp.y = sp.y+1
			local vec = {x=pp.x-sp.x, y=pp.y-sp.y, z=pp.z-sp.z}
			local dist = math.sqrt(vec.x^2 + vec.z^2)
			local yaw = math.atan2(-vec.x, vec.z)
			
			if dist > 20 then
				debug("on_step(): stop attacking "..self.attack)
				self.attack = ""
			elseif dist > 1.5 then
				self:set_velocity(yaw, self.attack_speed)
			end
			
			if math.sqrt(vec.x^2 + vec.z^2 + vec.y^2) <= 2.5 then
				self:set_velocity(yaw, 0)
				self.object:setyaw(yaw)
				local i
				for i=0, 2, 0.5 do
					pp.y = pp.y+i
					if minetest.line_of_sight(sp, pp, 0.1) then
						if self.timer <= 0 then
							debug("on_step(): punching "..self.attack)
							player:punch(self.object, 1.0, {damage_groups={fleshy=self.damage}})
							self.timer = 1.0
						end
					end
					pp.y = pp.y-i
				end
			end
		else
			if self.state == "stand" then
				
				self.velocity = {x=0, y=0, z=0}
				
				if math.random(1, 100) == 1 then
					debug("on_step(): changing state from stand to walk")
					self.state = "walk"
					self:set_velocity(self.object:getyaw(), self.walk_speed)
				end
				
			elseif self.state == "walk" then
				
				local yaw = self.object:getyaw()
				local v1 = self.object:getvelocity()
				local v2 = self.velocity
				if math.abs(v1.x - v2.x) > 0.5 or math.abs(v1.z - v2.z) > 0.5 then
					debug("on_step(): not moving in desired direction; change yaw")
					yaw = yaw + math.pi + (math.abs(-45, 45)/180*math.pi)
				elseif math.random(1, 100) == 1 then
					debug("on_step(): changing yaw while walking")
					yaw = yaw + math.random(-90, 90) / 180 * math.pi
				end
				self:set_velocity(yaw, self.walk_speed)
				
				if math.random(1, 400) == 1 then
					debug("on_step(): changing state from walk to stand")
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
						sp.y = sp.y + 1
						local vec = {x=pp.x-sp.x, y=pp.y-sp.y, z=pp.z-sp.z}
						local dist = math.sqrt(vec.x^2 + vec.z^2)
						if dist < 3 or (dist < 15 and minetest.line_of_sight(sp, pp, 0.5)) then
							debug("on_step(): attacking "..player:get_player_name())
							self.attack = player:get_player_name()
						end
					end
				end
			end
		end
		
		self.object:setvelocity({x=self.velocity.x, y=self.object:getvelocity().y, z=self.velocity.z})
		if math.abs(self.velocity.x) > 0.001 or math.abs(self.velocity.z) > 0.001 then
			local yaw = math.atan2(-self.velocity.x, self.velocity.z)
			self.object:setyaw(yaw)
		end
	end,
	
	on_punch = function(self, hitter)
		debug("on_punch()")
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
					debug("on_punch(): wearing out tool")
					tool:add_wear(65535/(uses*3))
					hitter:set_wielded_item(tool)
				end
			end
		end
		
		if hitter:is_player() then
			debug("on_punch(): attacking "..hitter:get_player_name())
			self.attack = hitter:get_player_name()
		end
	end,
	
	on_rightclick = function(self, clicker)
		
	end,
	
	get_staticdata = function(self)
		
	end,
})

minetest.register_abm({
	nodenames = {"base:stone"},
	neighbors = {"air"},
	interval = 30,
	chance = 8000,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if active_object_count > 40 then
			debug("spawn abm: too many objects")
			return
		end
		pos.y = pos.y+2
		if minetest.get_node(pos).name ~= "air" then
			debug("spawn abm: not enough air")
			return
		end
		pos.y = pos.y-1
		if minetest.get_node(pos).name ~= "air" then
			debug("spawn abm: not enough air")
			return
		end
		if minetest.get_node_light(pos) > 2 then
			debug("spawn abm: too bright")
			return
		end
		local num_objects = 0
		local _,obj
		for _,obj in ipairs(minetest.get_objects_inside_radius(pos, 16)) do
			if obj.get_luaentity and obj:get_luaentity() and obj:get_luaentity().name == "mobs:stone_monster" then
				num_objects = num_objects+1
			end
		end
		debug("spawn abm: num_objects="..num_objects)
		if num_objects > 3 then
			debug("spawn abm: too many objects")
			return
		end
		
		debug("spawn abm: === spawning stone_monster at "..minetest.pos_to_string(pos))
		minetest.add_entity(pos, "mobs:stone_monster")
	end,
})
