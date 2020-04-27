collision={}

function collision:mapv(b)
  local w,h,x,y=8,8,b.x+b.dx,b.y+b.dy
  return any_collide({
    {x,y+h},
    {x+w,y+h}
  },0)
end 

function collision:maph(b) 
  local w,h,x,y=8,8,b.x+b.dx,b.y+b.dy
  return any_collide({
    {x,y},
    {x+w,y},
    {x,y+h},
    {x+w,y+h}
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