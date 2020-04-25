stage={}

function stage:update()
  emmiters:update()
end

function stage:draw()
  map(0,0,0,0)
  emmiters:draw()
  draw_interface()
end
