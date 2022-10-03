# #Every time the number is divisible by 7, the child says 'polo' instead of the number. If the number is divisible by both 4 and 7, the child will say 'marcopolo'.
# puts (1..100).map {|i| if ((i % 4 == 0) && (i % 7 == 0))
# 		"marcopolo"
# 	elsif i % 4 == 0
# 		"marco"
# 	elsif i % 7 == 0
# 		"polo"
# 	else
# 	  i
# 	end }.join(',')
# interesting program
# test rule


(1..100).map do |i| 
	str = ""	 
	if i % 4 == 0
		str << "marco"
    end
	if i % 7 == 0
		str << "polo"
    end
	if str.empty?
		str << i.to_s
	end 
	puts str

end