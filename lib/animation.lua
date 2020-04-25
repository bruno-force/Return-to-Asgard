animation={}--class definition
--constructor
function animation:new(i,s)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  self.i=i--id
  self.t=0--timer
  self.s=s--sprites
  self.fs=6--frameskip
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
  return self.s[ceil(self.t/self.fs)]
end