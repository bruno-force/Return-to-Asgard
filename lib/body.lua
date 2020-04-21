bodies={}

-- CONSTRUCTORS
function add_body(x,y)
 return add(bodies, new_body(x,y))
end

function new_body(x,y)
 return {
  x=x,
  y=y,
  ax=0,
  ay=0
 }
end

-- INSTANCE METHODS
function before_update(f)
 print(this)
 print(self)
 print(self)
 assert(false)
end

function update_body(b)
 if(b.before_update!=nill)b.before_update()
 --Update Acceleration
 b.ax=max(0,b.ax-f)--
 b.ay=max(-1*3*g,b.ay-g)-- set max y acceleration to 3g
 --Update Coordinates
 b.x+=b.ax
 if(b.y<127-8)b.y=min(127-8,b.y-b.ay)
 if(b.after_update!=nil)b.after_update()
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
