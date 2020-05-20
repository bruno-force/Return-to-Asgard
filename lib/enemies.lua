enemy={} setmetatable(enemy, body) -- public class enemy extends body

enemies={} -- enemies list

local sprtbl={
  stand={48},
  walk={49,50,51,50},
  jup={48},
  jht={48},
  jdn={48}
}
local spd=.5

function enemy:add(x,y)
  add(enemies, enemy:new(x,y))
end

function enemy:new(x,y)
  local o = bodies:new(x,y)
  self.__index = self--THIS LINE IS SUPER IMPORTANT
  setmetatable(o, self)
  return o
end

--gamecycle
function enemy:before_update()
  self.dx=spd*sgn(self.dx) --set movement 
  self.fx=self.dx<0 -- set flip 
end

function enemy:after_update()
  if(abs(self.dx)>0) then self.a='walk'else self.a='stand' end
  if(self.animation==nil or not self.animation:is(self.a)) self.animation=animation:new(self.a,sprtbl[self.a])
  self.animation:update()
end

function enemy:hit_wall()
  if(not self.landed) return nil
  local a=flr(rnd(2))
  -- Turn Around
  if a==0 then
    if(self.fx) then self.dx=spd
    else self.dx=-spd end
  -- Jump
  elseif a==1 then 
    self.dy=-4
    self.landed=false
  end
end

