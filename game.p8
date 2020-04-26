pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

#include lib/utils.lua
#include lib/interface.lua
#include lib/stage.lua
#include lib/collisions.lua
#include lib/body.lua
#include lib/animation.lua
#include lib/emitter.lua
#include lib/particle.lua
#include lib/player.lua

gv=.3--gravity

function _init()
  emmiters:new_fire(25,95)
  emmiters:new_fire(112,95)
  player:init()
end

function _update60()
  stage:update()
  bodies:update()
  add_logs()
end

function _draw()
  cls()
  stage:draw()
  bodies:draw()
  console:print()
end

function add_logs()
  local p=player
  console:log('x',p.x)
  console:log('y',p.y)
  console:log('dx',p.dx)
  console:log('dy',p.dy)
  console:log('aid',p.animation.i)
  console:log('at',ceil(p.animation.t/p.animation.fs)..'/'..#p.animation.s)
  console:log('land',tostr(p.landed))
  console:log('tile',mget(p.x/8,p.y/8))
  console:log('flag',fget(mget(p.x/8,p.y/8)))
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
0000110000000011001111000ddd1dd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010000100110000100011100d1d111d1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000100111001100010000dd110111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000001100010000dd100001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11100000000000000001000011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1111100011111100000010d1000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d11dd11111d1dd100000000d1001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dd1ddd11ddd1dd10100000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000006262620000620000006200626262620062626262626200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6253414141626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6242626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6242626262626262626262626262736262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6242626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6242626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6242626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6242626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5342626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5362626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5362626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5362626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5362626262626262626262626262626262626262626262620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000004700000000000000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0044000000000000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000037230372303733047430574306743097430c7430e7330b7230872306723067131510015100151001510015100151001510015100151000c1000c1000b1000c1000c1000c1000c1000c1000c1000c100
000100000161006610106101c6100c610086100661004610036100161000610116002760026600256002360022600206001e6001c6001a60018600166001460012600116000f6000d6000b600086000760005600
