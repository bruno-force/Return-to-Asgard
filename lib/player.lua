player=bodies:new(64,0)

local sprtbl={
  stand={0},
  walk={1,2,3,2},
  jup={32},
  jht={33},
  jdn={34}
}

--constructor
function player:init()
  self.landed=false
  self.flp=false
  self.a=getaction()
end

--gamecycle
function player:before_update()
  h_move()
  v_move()
end

function player:after_update()
  print(self.a)
  local la=self.a
  self.a=getaction()

  if((la=='walk' or la=='stand') and self.a=='jup') sfx(0)
  if(la=='jdn' and (self.a=='stand' or self.a=='walk')) sfx(1)

  animate(self.a)
end

function player:draw()
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
function animate(i)
  local p=player
  if(p.animation==nil or not p.animation:is(i)) p.animation=animation:new(i,sprtbl[i])
  p.animation:update()
end