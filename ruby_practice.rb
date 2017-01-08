for i in (0..4)
	puts "#{13*i+3}"
end

for i in (0..3)
	if i==0
		puts "#{0}"
	else
		puts i
		puts i
	end
end

for i in (0..4)
	puts "#{3+5*i}"
end

for i in (0..2)
	puts 0
	puts 1
	puts 2
end

for i in (0..4)
	print "x"

	for j in (0...i)
		print "#{j}"
	end

	puts "x"
end