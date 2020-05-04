animation={}--class definition
--constructor
function animation:new(i,s)
  local o = {
    i=i,
    s=s,
    t=0,
    fs=16
  }
  
  setmetatable(o, self)
  self.__index = self
  return o
end

--instance methods
function animation:is(i)
  return self.i==i
end

function animation:update()
  if(self.t>#self.s*self.fs)self.t=0
  self.t+=1
end

function animation:get_sprite()
  return self.s[ceil(self.t/self.fs)] or self.s[1]
end