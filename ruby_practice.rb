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

def luckyNumbers(a, b)
	if a==7 || a==11 || b==7 || b==11 || (a+b)==7 || (a-b)==11 || (b-a)==11
		puts "Lucky"
	else
		puts "Unlucky"
	end
end

luckyNumbers(1, -6)

def printFence(n)
	if(n!=0)
		for j in (0..1)
			for i in (0...n-1)
				print("|---")
			end	
			puts "|"
		end
	end
end

printFence(1)

def printPowers(num)
	pow = 1
	current = num**pow

	print "1"
	while(current<100)
		print " and #{current}"
		pow += 1
		current = num**pow
	end
	print " are powers of #{num}\n"
end

printPowers(3)

def allFar(list)
	last = list[0]
	ind = 0
	isTrue = 1
	list.each do |i|
		if(ind!=0)
			if (last-i).abs<5
				isTrue = 0
				break
			end
			last = i
		else
			ind = 1
		end
	end
	puts "#{isTrue}"
end

allFar([7]) 

class Hacker
end
class Submission
end
class TestCase
end
class Contest
end

def identify_class(obj)
    case 
    when obj.is_a?(Hacker)
        puts "It's a Hacker!"
    when obj.is_a?(Submission)
        puts "It's a Submission!"
    when obj.is_a?(TestCase)
        puts "It's a TestCase!"
    when obj.is_a?(Contest)
        puts "It's a Contest!"
    else
        puts "It's an unknown model"
    end
end


def rot13(secret_messages)
    secret_messages.collect do |i|
        i.tr('a-zA-Z', 'n-za-mN-ZA-M')
    end
end

a = rot13(["Why did the chicken cross the road?", "Gb trg gb gur bgure fvqr!"])

puts "#{a}"

=begin
def sum_terms(n)
    a = (0..n).inject(0) {|sum, num| sum + num**2 + 1}
    puts "#{a}"
end

sum_terms(25)
=end

def sum_terms(n)
  1.upto(n).reduce(0) do |m, x|
    m + fn(x)
  end
end


def fn(x)
  x*x + 1
end

puts "#{sum_terms(25)}"