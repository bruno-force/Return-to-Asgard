
function collide_map(b) 
  return collide(b,0)
end 

function collide(b,f)
  local nbx,nby=b.x+b.dx,b.y+b.dy
  return fget(mget(nbx/8,nby/8),f) or fget(mget((nbx+8)/8,(nby+8)/8),f)
end