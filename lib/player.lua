pps={}--previous player state
local sy=8*13--tick, frame, step, std y pos
local sprites={
	stand=0,
	walk={1,2,3,2},
	talk={16,17,18}
}

function draw_sword()
	local dx
	if(p.flp) then
		dx=-4
	else
		dx=4
	end
	local sx=p.x+dx
	local sy=p.y+1
	spr(4,sx,sy,1,1,p.flp,false)
end

function init_player()
	p = {
		cs=0,--current sprite
		s=1,--player speed
		x=64,--position
		y=0,--position,
		ax=0,--acceleration
		ay=0,--acceleration
		flp=false,--flipped
		landed=false,
  t=0,--animation tick
		lt=0,--landed tick/timer
		it=0,--idle tick/timer
  f=1,--frame
  fs=12--frameskip
	}
end

function update_player()
	pps=shallow_copy(p)
	p.t=(p.t+1)%p.fs--update tick/timer
	h_move()
	v_move()
	do_sfx()
end

function draw_player()
	spr(p.cs,p.x,p.y,1,1,p.flp,false)
	if(p.atk==1) then
		draw_sword()
	end
end

function h_move()
	local l=btn(0)--left
	local r=btn(1)--right
	if l then
		p.x-=p.s
		if(p.x<0)p.x=128
		p.flp=true
	elseif r then
		p.x+=p.s
		if(p.x>128)p.x=0
		p.flp=false
	else

	end
end

function v_move()
	j=btnp(5)--jump
	p.landed=p.y==sy
	if j and p.landed then --if its on the floor allow to jump
		p.ay=4
		p.landed=false
		p.lt=0
	end
	if p.landed then--if is on the floor
		p.ay=0
		p.lt=min(4,p.lt+1)-- increment till 4
	else												--or in the air
		p.ay-=gv
		p.y=min(sy,p.y-p.ay)
	end
end

function anim_player()
	l=btn(0)--left
	r=btn(1)--right
	a=btn(4)--attack
	if l or r then
		if(p.landed)walk()
	else
		stand()
	end
	if(p.landed and pps.lt<4)land()
	if(not p.landed)jump()
	if(a) then attack()
	else p.atk=0 end
end

function stand()
	p.cs=sprites.stand
end

function walk()
	if(p.t==0) p.f=p.f%#sprites.walk+1
	p.cs=sprites.walk[p.f]
end

function land()
	p.cs=35
	create_dust_emitter(p.x+4,p.y+8)
end

function jump()
	if p.ay>0 then
		p.cs=32
	elseif p.ay==0 then
		p.cs=33
	elseif p.ay<0 then
		p.cs=34
	end
end

function attack()
	-- p.cs=2
	p.atk=1
end

function do_sfx()
	if (not p.landed and pps.landed) sfx(0)
	if (p.landed and not pps.landed) sfx(1)
end
