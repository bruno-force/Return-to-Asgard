gfe={}--emitters
local gt=0--graphic timer
local types = {fire=0, dust=1}

function update_gfe()
	for e in all(gfe) do
		update_emitter(e)
	end
end

function draw_gfe()
	for e in all(gfe) do
		draw_emitter(e)
	end
end

function create_emitter(x,y,st,fs,ls,type)--x,y,spawntime,frameskip,lifetime,type
	add(gfe,{x=x,y=y,st=st,fs=fs,ls=ls,type=type,t=0,pc=0,fx={}})
end

function spawn_particles(e)
 if((e.ls==nil or e.pc<e.ls) and e.t%e.st==0) then
  if e.type==types.fire then
   add_fire(e)
  elseif e.type==types.dust then
   add_dust(e)
  else
   asert(false,'no particle type found')
  end
  e.pc+=1
	end
end

function update_emitter(e)
 spawn_particles(e)
 for p in all(e.fx) do
  update_particle(p)
 end
 --update timer
 if(e.t<100) then e.t+=1
 else e.t=0 end
end

function draw_emitter(e)
 for p in all(e.fx) do
  draw_particle(p)
  if(p.t>p.ls*p.fs)del(e.fx,p) --remove particle if lifespan ended
  if(e.ls != nil and e.pc>e.ls and #e.fx == 0)del(gfe,e)  --remove emmiter if lifespan ended
 end
end

function create_fire_emitter(x,y)
	create_emitter(x,y,8,8,nil,types.fire)--x,y,spawntime,frameskip,maxparticles,type
end

function create_dust_emitter(x,y)
	create_emitter(x,y,1,4,1,types.dust)--x,y,spawntime,frameskip,maxparticles,type
end
