cstage='GAME'
function update_stage()
  update_gfe()
  update_player()
  anim_player()
end

function draw_stage()
  map(0,0,0,0)
  draw_gfe()
  --player.animate
  draw_player()
  --end::player.animate
  -- rect(0,0,127,127,6)
  draw_interface()
end
