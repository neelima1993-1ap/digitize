#Every time the number is divisible by 7, the child says 'polo' instead of the number. If the number is divisible by both 4 and 7, the child will say 'marcopolo'.
puts (1..100).map {|i| if ((i % 4 == 0) && (i % 7 == 0))
		"marcopolo"
	elsif i % 4 == 0
		"marco"
	elsif i % 7 == 0
		"polo"
	else
	  i
	end }.join(',')


