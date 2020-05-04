player=bodies:new(64,0)

local sprtbl={
  stand={1},
  walk={2,3,4,3},
  jup={32},
  jht={33},
  jdn={34}
}

--constructor
function player:init()
  self.landed=false
  self.flp=false
  self.a=getaction()
  animate(self)
end

--gamecycle
function player:before_update()
  h_move()
  v_move()
end

function player:after_update()
  local la=self.a
  self.a=getaction()

  if((la=='walk' or la=='stand') and self.a=='jup') sfx(0) -- jump
  if(la=='jdn' and (self.a=='stand' or self.a=='walk')) then --land
    emmiters:new_dust(self.x+4,self.y+8)
    emmiters:new_dust(self.x+4,self.y+8)
    sfx(1) 
  end

  animate(self)

  -- control camera
  local cx = peek2(0x5f28)
  local cy = peek2(0x5f2a)
  local bo=40--bounds offset
  local lb=cx+bo local ub=cx+128-bo
  if self.x<lb then
    cx+=self.x-lb
  elseif self.x+7>ub then
    cx+=self.x+7-ub
  end
  camera(cx, cy)
end

function player:draw()
  local cx = peek2(0x5f28)
  rect(cx+40,0,cx+40,127)
  rect(cx+128-40,0,cx+128-40,127)
  spr(self.animation:get_sprite(),self.x,self.y,1,1,self.fx,self.fy)
end

--movement
function h_move()
  local p=player
  if btn(0) then --left
    p.dx-=acc
    p.fx=true
  elseif btn(1) then --right
    p.dx+=acc
    p.fx=false
  end
end

function v_move()
  local p=player
  if btnp(5) and p.landed then --if its on the floor allow to jump
    p.dy=-4
    p.landed=false
  end
end

--actions
function getaction()
  local p=player
  --walk or stand
  if p.landed then 
    if abs(p.dx)>.1 then return 'walk'
    else return 'stand' end
  else --jump cycle
    local htt=0.5--hangtime treshold
    if p.dy<-1*htt then return 'jup'--ascend
    elseif p.dy<htt and p.dy>-1*htt then return 'jht'--hangtime 
    elseif p.dy>htt then return 'jdn' end--descend
  end
  --TODO:LAND
end

--animation
function animate(p)
  if(p.animation==nil or not p.animation:is(p.a)) p.animation=animation:new(p.a,sprtbl[p.a])
  p.animation:update()
end