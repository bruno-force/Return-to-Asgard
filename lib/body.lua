bodies={}
g,f=0.3,0.8--gravity,friction
local acc=0.5
local mdx=2
local mdy=2

-- CONSTRUCTORS
function add_body(x,y)
  return add(bodies, new_body(x,y))
end

function new_body(x,y)
  return {
    x=x,
    y=y,
    dx=0,
    dy=0
  }
end

-- INSTANCE METHODS
function update_body(b)
  if(b.before_update!=nill)b.before_update()
  _update_body(b)
  if(b.after_update!=nil)b.after_update()
end

function _update_body(b)
  --Update Acceleration
  b.dx=mid(-mdx,b.dx*f,mdx)
  b.dy=mid(-mdy,b.dy+g,mdy)
  --Check Collition
  if collide_map(b) then
    b.dx=0 b.dy=0
  end
  --Update Coordinates
  b.x+=b.dx
  b.y+=b.dy
end

function draw_body(b)
  spr(b.spr,b.x,b.y)
end

-- GAME CYCLE
function update_bodies()
  for b in all(bodies) do
    update_body(b)
  end
end

function draw_bodies()
  for b in all(bodies) do
    draw_body(b)
  end
end
