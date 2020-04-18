function shallow_copy(o)
	local rv = {}
	for k, v in pairs(o) do
	    rv[k] = v
	end
	return rv
end

function devlogs()
		--first col
	print('tick:'..p.t,2,2,13)
	print('pos x:'..p.x,2,12,13)
	print('pos y:'..p.y,2,22,13)
	print('sprt:'..p.cs,2,32,13)
	print('pprt:'..pps.cs,2,42,13)
	--second col
	print('jump:'..tostr(btnp(5)),52,2,13)
	print('accel x:'..p.ax,52,12,13)
	print('accel y:'..p.ay,52,22,13)
	print('landedt:'..p.lt,52,32,13)
end
