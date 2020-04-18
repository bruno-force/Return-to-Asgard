function draw_interface()
	for i=0,4 do
		local c
		if(i<3)then c=8
		else c=5 end
		print('♥',1+(6*i),121,c)
	end
end

function custom_menu()
	menuitem(1, 'custom menu item 1', nil)
end
