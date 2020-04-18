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
	spr(p.cs,p.x,p.y,1,1,p.flp,false)
	if(p.atk==1) then
		draw_sword()
	end
 --end::player.animate
	-- rect(0,0,127,127,6)
 draw_interface()
end
