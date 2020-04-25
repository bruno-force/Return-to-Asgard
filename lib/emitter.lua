emmiters={}
emmiter={}
gfe={}--emitters
local gt=0--graphic timer
local types = {fire=0, dust=1}

--EMMITERS

function emmiters:new(x,y,st,fs,ls,type)--x,y,spawntime,frameskip,lifetime,type
  add(gfe,emmiter:new(x,y,st,fs,ls,type))
end

function emmiters:new_fire(x,y)
  self:new(x,y,8,8,nil,types.fire)
end

function emmiters:new_dust(x,y)
  self:new(x,y,1,4,1,types.dust)
end

function emmiters:update()
  for e in all(gfe) do
    e:update()
  end
end

function emmiters:draw()
  for e in all(gfe) do
    e:draw()
  end
end

-- EMMITER

function emmiter:new(x,y,st,fs,ls,type)
  local o={x=x,y=y,st=st,fs=fs,ls=ls,type=type,t=0,pc=0,fx={}}
  setmetatable(o, self)
  self.__index = self--THIS LINE IS SUPER IMPORTANT
  return o
end

function emmiter:spawn()
  local e=self
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

function emmiter:update()
  local e=self
  e:spawn()
  for p in all(e.fx) do
    update_particle(p)
  end
  --update timer
  if(e.t<100) then e.t+=1
  else e.t=0 end
end

function emmiter:draw()
  local e=self
  for p in all(e.fx) do
    draw_particle(p)
  if(p.t>p.ls*p.fs)del(e.fx,p) --remove particle if lifespan ended
    if(e.ls != nil and e.pc>e.ls and #e.fx == 0)del(gfe,e)  --remove emmiter if lifespan ended
  end
end
