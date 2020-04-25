particle={}

function particle:new(x,y,c,ls,fs) 
  local o={x=x,y=y,c=c,ls=ls,fs=fs,t=0}
  setmetatable(o, self)
  self.__index = self--THIS LINE IS SUPER IMPORTANT
  return o
end

function particle:update()
  local p=self
  if((p.t%p.fs)==0) then
    local rx=rnd(3)
    p.y-=1
    p.x+=rx-rnd(rx*2)
  end
  --update timer
  p.t+=1
end

function particle:draw()
  local p=self
  if(pget(p.x,p.y)==0) circfill(p.x,p.y,1+rnd(2),1)
  pset(p.x,p.y,p.c)
end
