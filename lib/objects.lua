objects={}
object={}
--0 torch

function objects:add(tx,ty,s)
  -- add(objects,object:new(tx,ty,s))
  object:new(tx,ty,s)
end

function object:new(tx,ty,s)
  -- local o={tx=tx,ty=ty,s=s}
  --torch
  if s==74 then 
    emmiters:new_fire(tx*8+4,ty*8+5)
  --bad lights
  elseif s>63 and s<75 then
    local bl=bodies:new(tx*8,ty*8)
    bl.animation=animation:new('rotate',{s})
    mset(tx,ty,0)--remove from map
  end
  -- setmetatable(o, self)
  -- self.__index = self--THIS LINE IS SUPER IMPORTANT
  -- return o
end