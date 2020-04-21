gfe={}--emmiters
gfx={}--effects
local gt=0--graphic timer
local types = {'fire', 'dust'}

-- EMMITERS

function update_gfe()
	for e in all(gfe) do
		update_emmiter(e)
	end
end

function draw_gfe()
	for e in all(gfe) do
		draw_emmiter(e)
	end
end

function create_emmiter(x,y,st,fs,t)--x,y,spawntime,frameskip,type
	add(gfe,{x=x,y=y,st=st,fs=fs,t=t,fx={}})
end

function update_emmiter(e)
	print(e)
end

function draw_emmitter(e)
	print(e)
end

function create_fire_emmiter(x,y)
	create_emmiter(x,y,16,16,types.fire)
end

-- PARTICLES

function add_particle(x,y,ls,fs,c)--x, y, lifespan, frame skip, color
	add(gfx,{x=x,y=y,c=c,ls=ls,fs=fs,t=0})
end

function add_fire(x,y)
	local fs=16
	add_particle(x,y,3+rnd(5),fs,9)
	add_particle(x,y,2+rnd(3),fs,8)
end

function add_dust(x,y)
	add_particle(x,y,3+rnd(3),4,7)
end

function create_gfx()
	if(gt%10==0) then
		add_fire(25,95)
		add_fire(112,95)
	end
	gt+=1
end

function update_gfx()
		for g in all(gfx) do
			if((g.t%g.fs)==0) then
				local rx=rnd(3)
				g.y-=1
				g.x+=rx-rnd(rx*2)
			end
			g.t+=1
		end
end

function draw_gfx()
	for g in all(gfx) do
		if(pget(g.x,g.y)==0) circfill(g.x,g.y,1+rnd(2),1)
		pset(g.x,g.y,g.c)
		if(g.t>g.ls*g.fs)del(gfx,g) --remove if lifespan ended
	end
end
