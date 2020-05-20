function draw_interface()
  local cx = peek2(0x5f28) local cy = peek2(0x5f2a)
  local of= 3 local l=127
  local stagename='barva'
  --frame
  rect(cx,cy+of,cx+l,cy+l-of,5)
  --title
  rectfill(cx,cy,cx+#stagename*4,cy+6,0)
  print(stagename,cx,cy+1,5)
  --status
  rectfill(cx+32,cy+127-6,cx+96,cy+127,0)

  for i=0,5 do
    local c
    if(i<3)then c=8
    else c=5 end
    print('♥',cx+33+(6*i),cy+127-4,c)
  end
end