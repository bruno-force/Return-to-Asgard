objects={}
object={}
--0 torch

function objects:add(tx,ty,t)
  add(objects,object:new(tx,ty,t))
end

function object:new(tx,ty,t)
  local o={tx=tx,ty=ty,t=type}
  if t=='torch' then
      emmiters:new_fire(tx*8+4,ty*8+5)
  else
    assert(false,'mobject not supported:'..t)
  end
  setmetatable(o, self)
  self.__index = self--THIS LINE IS SUPER IMPORTANT
  return o
end