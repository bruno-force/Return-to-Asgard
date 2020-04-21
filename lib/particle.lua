
function add_particle(e,x,y,ls,fs,c)--emmiter,x,y,lifespan,frame skip,color
	add(e.fx,{x=x,y=y,c=c,ls=ls,fs=fs,t=0})
end

function add_fire(e)
	add_particle(e,e.x,e.y,3+rnd(5),e.fs,9)
	add_particle(e,e.x,e.y,2+rnd(3),e.fs,8)
end

function add_dust(e,x,y)
	add_particle(e,e.x,e.y,3+rnd(3),e.fs,7)
end

function update_particle(p)
		if((p.t%p.fs)==0) then
			local rx=rnd(3)
			p.y-=1
			p.x+=rx-rnd(rx*2)
		end
  --update timer
  p.t+=1
end

function draw_particle(p)
 if(pget(p.x,p.y)==0) circfill(p.x,p.y,1+rnd(2),1)
 pset(p.x,p.y,p.c)
end
