--constructor
function init_player()
  p = bodies:new(64,0)
  p.landed=false
  p.flp=false
  p.before_update = before_update
  p.after_update = after_update
end

--gamecycle
function before_update()
  h_move()
  v_move()
end

function after_update()
  animate()
end

--movement
function h_move()
  if btn(0) then --left
    p.dx-=acc
    p.fx=true
  elseif btn(1) then --right
    p.dx+=acc
    p.fx=false
  end
end

function v_move()
  if btnp(5) and p.landed then --if its on the floor allow to jump
    p.dy=-4
    p.landed=false
  end
end

--animation/actions
function animate()
  local i,s
  --walk or stand
  if p.landed then 
    if abs(p.dx)>.1 then i='walk' s={1,2,3,2} 
    else i='stand' s={0} end
  --jump cycle
  else
    local htt=0.5--hangtime treshold
    if p.dy<-1*htt then i='jup' s={32} --going up
    elseif p.dy<htt and p.dy>-1*htt then i='jht' s={33} --hangtime 
    elseif p.dy>htt then i='jdn' s={34} end--going down 
  end
  --TODO:LAND
  change_animation(i,s)
  p.animation:update()
end

function change_animation(i,s) 
  if(p.animation==nil or not p.animation:is(i)) p.animation=animation:new(i,s)
end