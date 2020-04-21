pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
#include lib/utils.lua
#include lib/interface.lua
#include lib/stage.lua
#include lib/emitter.lua
#include lib/particle.lua
#include lib/player.lua

gv=.3--gravity

function _init()
	create_fire_emitter(25,95)
	create_fire_emitter(112,95)
	custom_menu()
	init_player()
end

function _update60()
	update_stage()
end

function _draw()
	cls()
	draw_stage()
	devlogs()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555500005555000055550000555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
005fff00005fff00005fff00005fff00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0041ff100041ff100041ff100041ff10015777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06444460064444000064440000644400668556670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f1144f00ff144f000ff4400001ff400015777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f1114f0001114000011140000111400001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f00f000f000f00000f000000f00f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555500005555000055550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
005fff00005fff00005fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0041ff100041ff100041ff1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06444260064442600644226000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f1144f00f1142f00f1144f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f1114f00f1114f00f1114f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f00f0000f00f0000f00f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555500005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
005fff00005fff000055550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0041ff1f0041ff1f005fff0000555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0644446ff644446ff041ff1f005fff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff1440000114400064444600041ff10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111f0000f11f000011440006444460000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f00f0000f00f0000f11f000ff14ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f000000000000000f00f0000f11f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1ddd1dddd1dddd1d1100110010000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111dd1111d1111d11011000000011d011000000010110000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000111100111000dd100000011001dd011001100100100000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000000000000dd100001011001dd000001100001100000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000000001001110000001100111110001100000000000000001000000000000000000000000000000000000000000000000000000000000000000000000
0000011001100010d100110000001111010011100111000000000011000000000000000000000000000000000000000000000000000000000000000000000000
0101111001100010d100110000001ddd000011100111001000000011000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001100000000001ddd000000000000000000000111000000000000000000000000000000000000000000000000000000000000000000000000
00001100000000110011110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01000010011000010001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100010011100110001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000110001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11100000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d111110001111110000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d11dd11111d1dd10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dd1ddd11ddd1dd10100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001ddd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000011111111d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d1111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dd1111881111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111111988111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0011111999911dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd11189a9811dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd11111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01111114491111d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01111114441111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111111411ddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d11111411ddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000011d111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000043000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000004200004443004500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000004263636343515050515100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5150505150514200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000520000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4200606100000000000000004460610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4500707143420000000000000070710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041404041404140414041414041414000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000474400000000520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000004700000000000000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0044000000000000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0101000006013080130a0330c0330e04310053120531304314043160331702317013170131510015100151001510015100151001510015100151000c1000c1000b1000c1000c1000c1000c1000c1000c1000c100
0001000024610216101e6101c6101b61019610186101661014610126100f610116002760026600256002360022600206001e6001c6001a60018600166001460012600116000f6000d6000b600086000760005600