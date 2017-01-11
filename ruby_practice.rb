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

def cylinderSurfaceArea(radius, height)
	@r = radius
	@h = height
	2*Math::PI*(@r**2)+2*Math::PI*@r*@h
end

puts "#{cylinderSurfaceArea(1,1)}"

def drawBox(size)
	for i in (0...size)
		for j in (0...size)
			if (((i==1) || (i==size-2)) && (1..size-2).include?(j)) || (((j==1) || (j==size-2)) && (1..size-2).include?(i))
				print "x"
			else
				print "-"
			end
		end
		puts ''
	end
end

drawBox(10)

def addOddStrings(num)
	final = ''
	num.each do |str|
		if str.length%2 != 0
			final = final + str
		end
	end

	puts final
end

addOddStrings(["Hello", "World", "it's very nice", "to", "meet you!"])

def count613(nums)
	lastnum = 0
	count = 0
	nums.each do |num|
		if (lastnum == 6 && num == 13) || (lastnum == 61 && num == 3)
			# puts "YES!"
			count += 1
		end
		lastnum = num
	end
	puts "#{count}"
end

count613([6, 13, 2, 61, 3, 3, 9, 61, 3, 6, 13])

def everyOther(items)
	on = 1
	ind = 0
	result = Array.new
	items.each do |item|
		if on%2 != 0
			result[ind] = item
			ind += 1
			puts "#{item}"
		end
		# ind +=1
		on +=1
	end
	puts "#{result}"
end

everyOther([2,4,6,8,10,12,14])