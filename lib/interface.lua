function draw_interface()
  local cx = peek2(0x5f28)
  local cy = peek2(0x5f2a)
  for i=0,4 do
    local c
    if(i<3)then c=8
    else c=5 end
    print('♥',cx+1+(6*i),121,c)
  end
end