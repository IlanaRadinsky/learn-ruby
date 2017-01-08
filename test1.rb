#to include a module in a file, need to write:
#$LOAD_PATH << '.' (files must be searched in the current directory)
#require '[module_name]' (.rb extension not needed)

=begin
BEGIN {
	puts "Initializing program..."
}

END {
	puts "Terminating program..."
	puts "Program terminated."
}


$global_variable = 10

class Customer
	@@no_of_customers = 0
	::CONST = 5 #:: makes it a global constant

	def initialize(id, name, addr)
		@cust_id = id
		@cust_name = name
		@cust_addr = addr
		@@no_of_customers +=1
	end

	def print_name
		puts "Customer id: #{@cust_id}"
		puts "Customer name: #{@cust_name}"
		puts "Customer address: #{@cust_addr}"
	end

	def num_cust
		puts "Number of Customers: #@@no_of_customers"
	end
end

if __FILE__ == $0
	cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
	cust1.num_cust
	cust2 = Customer.new("2", "Paul", "New Empire Rd, Khandala")
	cust1.print_name
	cust2.num_cust
	cust1.num_cust
	puts "#{Customer::CONST}"
end
=end

=begin
ary = ["fred", 10, 3.14, "This is a string", "last element"]
ary.each do |i|
	puts i
end

names = Array.new(20)
puts names.size
puts names.length

names1 = Array.new(4, "Sam")
puts "#{names1}"

nums = Array.new(10) {|e| e=e*2}
puts "#{nums}"

nums2 = Array[1,2,3,4,5]
puts "#{nums2}"

nums3 = Array(0..9)
puts "#{nums3}"
num = nums3.at(6)
puts "#{num}"

comb = nums2&nums3
puts "#{comb}"

comb1 = comb*3
puts "#{comb1}"

comb1 = comb*"Hello"
puts "#{comb1}"

puts "#{nums2<=>nums3}"

puts "#{nums3[2..5]}"

hsh = colors = {"red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f}
hsh.each do |key, value|
	print key, " is ", value, "\n"
end

(10..15).each do |n|
	print n, ' '
end

puts 

(10...15).each do |n|
	print n, ' '
end

puts

a, b, c = 10, 20, 30
print a, ' ', b, ' ', c, "\n"

a, b = b, c
print a, ' ', b, ' ', c, "\n"

a==b ? t=1 : t=0
puts t

puts "#{defined? t}"
puts "#{defined? l}"
puts "#{defined? puts}"
=end

=begin
x=1
if x>2
	puts "x is greater than 2"
elsif x<=2 and x!=0 
	puts "x is 1"
else
	puts "I can't guess the number"
end

if x==1 then puts "x is 1" end

puts "x is 1" if x==1

unless x!=1
	puts "x is 1"
else
	puts "I can't guess the number"
end

puts "x is 1" unless x!=1

case x
when 2..500
	puts "x>2"
when 1
	puts "x is 1"
else
	puts "I can't guess the number"
end

i = 0
while i<5 do
	puts "Inside the loop i = #{i}"
	i += 1
end

i+=1 while i<10
puts "#{i}"

i=0
begin
	puts "Inside the loop i = #{i}"
	i += 1
end while i<5

j = 0
until j==5
	puts "Inside the loop j = #{j}"
	j +=1
end

j+=1 until j==10
puts "#{j}"

for i in 0...5 #i is a local variable and be access even after the conclusion of the loop
	puts "Value of local variable is #{i}"
end

puts "i is #{i}"

(0..5).each do |i| #i only exists within the scope of this loop
	puts "Value of variable is #{i}"
end

puts "i is #{i}"

for i in 0..5
	if i<2 then next
	end
	puts "Value of i = #{i}"
end

for i in 0..5
	if i<2 then 
		puts "Value of i = #{i}"
		#redo -> redo would make it an infinite loop
	end
end

=begin
for i in 1..5
	retry if i>2 #invalid retry bc will result in an infinite loop
	puts "i = #{i}"
end
=end

=begin
def test(a1="Ruby", a2 = "Perl")
	puts "The programming language is #{a1}"
	puts "The programming language is #{a2}"
end

test "C", "C++"
test "C"
test

def test1
	i = 100
	j = 10
	k = 0 #all methods return a value - default value is the value of the last statement
end

puts "#{test1}" 

def test2
	i = 100
	j = 10
	k = 0
	return i, j, k
end

puts "#{test2}"


def sample (*test) #takes an parameters, in any quantities
	puts "#{test}"

	puts "The number of parameters is #{test.length}"

	for i in 0...test.length
		puts "The parameters are #{test[i]}"
	end
end

sample "Zara", "6", "F"
sample "Mac", "36", "M", "MCA"

class Accounts
	def reading_charge
	end
	def Accounts.return_date #since this method was defined using
							 #[class_name].[method_name], the method can be
							 # accessed even outside the class
		puts "1/4/17"
	end
end

Accounts.return_date

alias foo sample #create another way to refer to "sample" using "foo"
foo "Hello", "27", 'c'

$HELLO = 1
alias $GOODBYE $HELLO #can do the same for constants
puts "#{$GOODBYE}"

# ***ALIASES ARE RISKY - MIGHT FORGET WHAT THE METHOD ACTUALLY IS ***

#undef sample -> this statement would result in the method "sample" being viewed as undefined
sample "Yay", "Me"
=end

=begin
def test
	puts "You are in the method"
	yield #inserts the block of code with the same name as the method
	puts "You are again back in the method"
	yield
end

test {puts "You are in the block"}

def test1
	yield 5, 6
	puts "You are in the method test1"
	yield 100, 101
end

test1 {|i, j| puts "Your numbers are #{i} and #{j}"}

def test2(&block)
	block.call
end
test2 {puts "Hello World!"}

module Moral
	VERY_BAD = 0
	BAD = 1

	def Moral.sin(badness)
		case badness
		when VERY_BAD
			puts "Terrible awful sin"
		when BAD
			puts "Terrible sin"
		else
			puts "Eh"
		end
	end
end

Moral.sin(0) #access module methods using Module name 
			 #(method has to be defined as public in form 
			 #[module_name].[method_name] like with classes)

puts "#{Moral::VERY_BAD}" #access module constants using form
						#[Module name]::[constant name] like with classes

Moral.sin(Moral::BAD)

module Week
	FIRST_DAY = "Sunday"
	def Week.weeks_in_month
		puts "There are 4 weeks in a month"
	end
	def Week.weeks_in_year
		puts "There are 52 weeks in a year"
	end
end

class Decade
include Week #can embed a module from a different file into a class
			 #if you have first required the file at the top of the code
	no_of_yrs = 10
	def no_of_months
		puts Week::FIRST_DAY
		number=10*12
		puts number
	end
end

d1 = Decade.new
puts Week::FIRST_DAY
Week.weeks_in_month
Week.weeks_in_year
d1.no_of_months

module A
	HEY = 7
	def first_method
		puts "a"
	end
end

module B
	def second_method
		puts "b"
	end
end

class TestBunny
include A
include B #TestBunny has multiple inheritance!!
end

tb = TestBunny.new
tb.first_method
tb.second_method
puts "#{TestBunny::HEY}"

puts "Hi from GitHub.com"

puts %{Hello}
puts %^Hello2^ #delimiter characters are arbitrary, as long as preceeded by %
puts %Q{Ruby is fun}
puts "Say \"hi!\""
puts "\tHello!" #in a double-quoted string, escape characters are interpreted
puts '\tHello!' #in a single-quoted string, escape characters are preserved

myStr = String.new("THIS IS A TEST") #to use string methods, must create a string OBJECT
foo = myStr.downcase

puts "#{foo}"

foo = foo*3
puts "#{foo}"

months = Hash.new "month" #default value of months is "month", if don't include "month" then default value is nil
puts "#{months[0]}"
puts "#{months[72]}"

months = {"1"=> "January", "2"=> "February"}
keys = months.keys
puts "#{keys}"

H = Hash["a" => 100, "b"=> 200]

puts "#{H["a"]}"
puts "#{H["b"]}"

tester = Hash[[1,"jan"]=>"January"] #can use any Ruby object as a key or value
puts "#{tester[[1,"jan"]]}"

#----- DATE AND TIME ------
time1 = Time.new #or Time.now 

puts "Current Time: " + time1.inspect #returns current time

time = Time.new

# Components of a Time
puts "Current Time : " + time.inspect
puts time.year    # => Year of the date 
puts time.month   # => Month of the date (1 to 12)
puts time.day     # => Day of the date (1 to 31 )
puts time.wday    # => 0: Day of week: 0 is Sunday
puts time.yday    # => 365: Day of year
puts time.hour    # => 23: 24-hour clock
puts time.min     # => 59
puts time.sec     # => 59
puts time.usec    # => 999999: microseconds
puts time.zone    # => "UTC": timezone name

# July 8, 2008
Time.local(2008, 7, 8)  
# July 8, 2008, 09:10am, local time
Time.local(2008, 7, 8, 9, 10)   
# July 8, 2008, 09:10 UTC
Time.utc(2008, 7, 8, 9, 10)  
# July 8, 2008, 09:10:11 GMT (same as UTC)
Time.gm(2008, 7, 8, 9, 10, 11)  

time = Time.new

puts "#{time.to_a}" #returns array in form: [sec,min,hour,day,month,year,wday,yday,isdst,zone]
					#can then pass this array to time.utc to get it in UTC format

puts "#{Time.now.to_i}"					

# ---- RANGES ----

range1 = (1..10).to_a #converts a range to an array
range2 = ('bar'..'bat').to_a

puts "#{range1}"
puts "#{range2}"

# Assume a range
digits = 0..9

puts digits.include?(5)
ret = digits.min
puts "Min value is #{ret}"

ret = digits.max
puts "Max value is #{ret}"

ret = digits.reject {|i| i < 5 }
puts "Rejected values are #{ret}"

digits.each do |digit|
   puts "In Loop #{digit}"
end

if ((1..10)===5)
	puts "5 lies in (1..10)"
end

a = (1..5).to_a
puts a.collect{ |e| e} #using #{} returns the array as a value
puts ('a'..'i').to_a #just returning the array itself puts each element of the array on a line of its own

b = a.collect{|x| 10*x}
puts b

# ---- STD I/O -----
# puts "Enter a value: "
# val = gets
# puts val

aFile = File.new("myfile.txt", "r+")
if aFile
	aFile.syswrite("ABCDEF")
else
	puts "Unable to open file!"
end

arr = IO.readlines("myfile.txt")
puts arr[0]
puts arr[1]
puts arr

=end

# ---- CLASSES ----
class Box
	BOX_COMPANY = "TATA Inc" #class constant - cannot be changed once defined

	@@count = 0 #class variable - shared between all instances of the class
	def initialize(w,h)
		@width, @height = w, h #@ -> instance variables
		@@count += 1
	end

	#to string method - all classes should have one of these
	def to_s 
		"(w:#@width, h:#@height)"
	end

	#class method - can be called without an instance of the class in form [class name].method()
	def self.printCount() #definte 
		puts "Box count is: #@@count"
	end

	#accessor methods
	def boxWidth
		@width #don't need return statement bc function will automatically return the last value
	end

	def boxHeight
		@height
	end

	#setter methods
	def setWidth=(value) #can't have spaces in between method name and =
		@width = value
	end

	def setHeight=(value)
		@height = value
	end

	def getArea
		@width * @height
	end

	#operator overloading
	def +(other) #vector addition of 2 box objects
		Box.new(@width + other.width, @height +  other.height)
	end

	def -@ #unary minus to negate height and width
		Box.new(-@width, -@height)
	end

	def *(scalar) #multiplies Box width and height by a scalar
		Box.new(@width*scalar, @height*scalar)
	end
end

class BigBox < Box #BigBox is a subclass of Box
	def getArea #can override Box methods or define new methods
		@area = @width * @height
		puts "Bix box area is: #@area"
	end
end

b = Box.new(5,6)
puts "#{b.to_s}"
b = -b
puts "#{b.to_s}"

b.freeze
if b.frozen?
	puts "Box object is a frozen object"
else
	puts "Box object is normal object"
end

# b.setWidth=21 => won't work bc b is frozen

puts Box::BOX_COMPANY

box1 = Box.allocate #creates an uninitialized Box object


#---- SEARCH AND REPLACE ----
phone = "2004-959-559 #This is Phone Number"

# Delete Ruby-style comments
phone = phone.sub!(/#.*$/, "")   #deletes everything after the #
puts "Phone Num : #{phone}"		#sub replaces first occurence, gsub replaces all occurences
								#without ! => returns a new string; with ! => modifies the original string

# Remove anything other than digits
phone = phone.gsub!(/\D/, "")    
puts "Phone Num : #{phone}"