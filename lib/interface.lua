function draw_interface()
  local cx = peek2(0x5f28)
  -- rect(cx+40,0,cx+40,127,13)
  -- rect(cx+128-40,0,cx+128-40,127,13)

  for i=0,4 do
    local c
    if(i<3)then c=8
    else c=5 end
    print('♥',cx+1+(6*i),121,c)
  end
end