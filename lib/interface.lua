function draw_interface()
  local cx = peek2(0x5f28) local cy = peek2(0x5f2a)
  local of= 3 local l=127
  --frame
  rect(cx,cy+of,cx+l,cy+l-of,13)

  for i=0,5 do
    local c
    if(i<3)then c=8
    else c=5 end
    print('♥',cx+2+(6*i),cy+of+3,c)
  end
end