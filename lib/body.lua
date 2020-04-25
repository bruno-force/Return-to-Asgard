bodies={}
g,f=0.3,0.85--gravity,friction
acc=0.5
local mdx=1
local mdy=3

-- BODIES
function bodies:new(x,y)
  return add(bodies, body:new(x,y))
end

function bodies:update()
  for b in all(self) do
    b:update()
  end
end

function bodies:draw()
  for b in all(self) do
    b:draw()
  end
end

--BODY

body={}
function body:new(x,y)
  local o = {
    x=x,
    y=y,
    dx=0,
    dy=0,
    fx=false,--flip
    fy=false--flip
  }
  setmetatable(o, self)
  self.__index = self--THIS LINE IS SUPER IMPORTANT
  return o
end

-- INSTANCE METHODS
function body:update()
  if(self.before_update!=nill)self:before_update()
  self:_update()
  if(self.after_update!=nil)self:after_update()
end

function body:_update()
  --Update Acceleration
  self.dx=mid(-mdx,self.dx*f,mdx)
  self.dy=mid(-mdy,self.dy+g,mdy)
  --Check Collition
  if collision:map(self) then
    self.dy=0
    self.landed=true
  end
  --Update Coordinates
  self.x+=self.dx
  self.y+=self.dy
  --Bounds
  if(self.x<0 and self.dx<0) self.x=127
  if(self.x>127 and self.dx>0) self.x=0
end
