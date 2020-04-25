console={}
lgs={}

function console:log(l,v)
  add(lgs,{l,v})
end

function console:terminal(l,v)
  printh(l..':'..v)
end

function console:print()
  local c=13
  local ox,oy=2,2--offset
  --first col
  for i,l in pairs(lgs) do
    local px,py=ox,2+oy--print pos
    if(i%2!=0) then 
    else 
      px+=40
    end
    py=oy+(6*(flr((i-1)/2)))--floor division
    print(l[1]..':'..l[2],px,py,c)
  end
  lgs={}
end