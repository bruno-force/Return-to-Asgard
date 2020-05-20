collision={}

function collision:floor(x,y)
  local w,h=3,8
  console:pixel(x,y+h,14)
  console:pixel(x+w,y+h,14)
  return collide_flag({
    {x,y+h},
    {x+w,y+h}
  },0)
end 

function collision:roof(x,y)
  local w,h=3,8
  console:pixel(x,y,14)
  console:pixel(x+w,y,14)
  return collide_flag({
    {x,y},
    {x+w,y}
  },1)
end 

function collision:walls(x,y) 
  local w,h=8,7
  console:pixel(x,y,10)
  console:pixel(x,y+h,10)
  return collide_flag({
    {x,y},
    {x,y+h}
  },2)
end 

function collide_flag(p,f)
  for co in all(p) do
    if fget(mget(co[1]/8,co[2]/8),f)then return true end
  end
  return false
end

function collide_sprite(p,s)
  for co in all(p) do
    console:pixel(co[1],co[2],12)
    if mget(co[1]/8,co[2]/8) == s then return true end
  end
  return false
end