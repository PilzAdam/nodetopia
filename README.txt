Pilztest game for the Minetest engine
=====================================

Installation:
-------------
Place it in $path_user/games/ and select it in the main menu.

Goal:
-----
This game aims to have a challenging survival gameplay.
The "voxel idea" plays a big role, there are only a few non cubic items.

Tips (for people who know minetest_game):
-----------------------------------------
- Wood can be made out of 4 leaves, which is required to make tools.
- The furnace is made out of clay.
- Pumpkins are food, can be found in forests and grow on wet soil.
- Hungry players get slower.
- Every player gets one backpack.
- A lamp is crafted with coal and 4 wood.

Commands:
---------
- /givebackpack <name>: use this instead of /give <name> backpack:backpack
- /hunger <name> | <name> <amount>: prints or sets the hunger of a player.

Settings:
---------
- creative_mode: boolean, unlimited items, bigger inventory, no bones after
                 death, no hunger and items don't wear out.
- enable_damage: boolean, players cant die, mobs don't chase players.
- spawn_mobs: boolean, weather mobs should spawn (only read at server startup).
- enable_3d_models: boolean, weather 3D models should be used for players and
                    mobs, default is true.

License of sourcecode:
----------------------
Pilztest
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

License of media (textures, sounds and models):
-----------------------------------------------
Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
http://creativecommons.org/licenses/by-sa/3.0/

Authors of media (textures, sounds and models):
-----------------------------------------------
Everything not listed here: Copyright (C) 2013 PilzAdam <pilzadam@minetest.net>

Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>:
  base_furnace_fire_bg.png
  base_furnace_fire_fg.png

Copyright (C) 2013 Mito551:
  All soundfiles (*.ogg)

models_player.png based on Jordach's character.png
