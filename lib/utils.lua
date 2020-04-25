logs={}

function shallow_copy(o)
  local rv = {}
  for k, v in pairs(o) do
    rv[k] = v
  end
  return rv
end

function print_logs()
  local c=13
  local ox,oy=2,2--offset
  --first col
  for i,l in pairs(logs) do
    local px,py=ox,2+oy--print pos
    if(i%2!=0) then 
    else 
      px+=40
    end
    py=oy+(6*(flr((i-1)/2)))--floor division
    print(l[1]..':'..l[2],px,py,c)
  end
  logs={}
end

function log(l,v)
  add(logs,{l,v})
end
