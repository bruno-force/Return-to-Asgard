collision={}

function collision:floor(x,y)
  local w,h=3,8
  console:pixel(x,y+h,14)
  console:pixel(x+w,y+h,14)
  return any_collide({
    {x,y+h},
    {x+w,y+h}
  },0)
end 

function collision:roof(x,y)
  local w,h=3,8
  console:pixel(x,y,14)
  console:pixel(x+w,y,14)
  return any_collide({
    {x,y},
    {x+w,y}
  },0)
end 

function collision:walls(x,y) 
  local w,h=8,7
  console:pixel(x,y,10)
  console:pixel(x,y+h,10)
  return any_collide({
    {x,y},
    {x,y+h}
  },1)
end 

function all_collide(p,f)
  for co in all(p) do
    if not collide(co[1],co[2],f) then return false end
  end
  return true
end

function any_collide(p,f)
  for co in all(p) do
    if collide(co[1],co[2],f) then return true end
  end
  return false
end

function collide(x,y,f)
  return fget(mget(x/8,y/8),f)
end