console={}
lgs={}
pxls={}

function console:log(l,v)
  add(lgs,{l,v})
end

function console:terminal(l,v)
  printh(l..':'..v)
end

function console:pixel(x,y,c)
  add(pxls,{x,y,c})
end

function console:draw()
  local cx = peek2(0x5f28)
  local cy = peek2(0x5f2a)
  local c=13
  local ox,oy=2,2--offset
  
  for i,l in pairs(lgs) do
    local px,py=ox,2+oy--print pos
    if(i%2!=0) then 
    else 
      px+=40
    end
    py=oy+(6*(flr((i-1)/2)))--floor division
    print(l[1]..':'..l[2],cx+px,cy+py,c)
  end
  lgs={}

  for p in all(pxls) do
    pset(p[1],p[2],p[3])
  end
  pxls={}
end

--DEBUG
debug={active=true}

function toggledebug()
  debug.active=not debug.active
  menuitem(1,"debug:"..tostr(debug.active),toggledebug)
end

function debug:breakpoint()
  self.stopped=self.active and not btnp(4) and not btnp(5)
  return self.stopped
end