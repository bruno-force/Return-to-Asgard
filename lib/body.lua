bodieslist={}
g,f=0.3,0.85--gravity,friction
acc=0.5
local mdx=1
local mdy=3

bodies={}
-- BODIES
function bodies:new(x,y)
  return add(bodieslist, body:new(x,y))
end

function bodies:update()
  for b in all(bodieslist) do
    b:update()
  end
end

function bodies:draw()
  for b in all(bodieslist) do
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
  --Vertical Collision
  for i=0,abs(self.dy) do
    local di=i*sgn(self.dy)
    if self.dy > 0 and collision:floor(self.x+2,self.y+di) then 
      self.dy=di self.landed=true 
      if(self.hit_floor!=nil)self:hit_floor()
      break 
    else
      self.landed=false 
    end
    
    if self.dy < 0 and collision:roof(self.x+2,self.y+di) then
      self.dy=0 
      if(self.hit_roof!=nil)self:hit_roof()
      break 
    end
  end
  --Horizontal Collision
  for i=0,abs(self.dx) do
    local x=self.x--IMPROVE
    if(sgn(self.dx)==1) x+=7
    if collision:walls(x+i*sgn(self.dx),self.y) then 
      self.dx=i*sgn(self.dx) 
      if(self.hit_wall!=nil)self:hit_wall()
      break 
    end
  end
  --Update Coordinates
  self.x+=self.dx
  self.y+=self.dy
  --Bounds
  -- if(self.x<0 and self.dx<0) self.x=127
  -- if(self.x>127 and self.dx>0) self.x=0
end
