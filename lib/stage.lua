stage={}

function stage:init() 
  -- TODO: read tiles
  for cx=1,127 do
    for cy=1,63 do
      local s=mget(cx,cy)
      --player
      if s==1 then
        if(pready) assert(false,'player already defined')
        player:init(cx*8,cy*8)
        mset(cx,cy,0)--remove from map
      --enemies
      elseif s==48 then
        enemy:add(cx*8,cy*8)--add enemy
        mset(cx,cy,0)--remove from map
      else
        objects:add(cx,cy,s)
      end
    end
  end
end

function stage:update()
  emmiters:update()
end

function stage:draw()
  map(0,0)
  emmiters:draw()
  draw_interface()
end
