# 1	Сложите все натуральные числа до тысячи, кратные 3 или 5.
def euler_1
 by_3 = Proc.new { |x| x%3 == 0 }
 by_5 = Proc.new { |x| x%5 == 0 }

 sum_3 = (1...1000).select(&by_3)
 sum_5 = (1...1000).select(&by_5).reduce(:+)
 sum_3_5 = sum_3.select(&by_5).reduce(:+)
 p sum_3.reduce(&:+) + sum_5 - sum_3_5
end
p "1 euler"
euler_1
p "*******"

def euler_1_1
  sum = ((1..999).find_all { |i| i % 5 == 0 || i % 3 == 0 }).reduce(:+)
  return sum
end
puts euler_1_1
p "******"

# 2 Найдите сумму всех чётных элементов ряда Фибоначчи, которые не превышают 
#четыре миллиона.

def fibonachi
	mass = [0,1,1]
	i = 2
	chet = 0
	while (mass[i] + mass[i-1]) < 4000000
		i += 1
		mass[i] = mass[i-1] + mass[i-2]
		chet += mass[i] if(mass[i]%2 == 0)
	end
# chet = Proc.new{ |x| x%2 == 0 }
# p mass.select(&chet).reduce(&:+)
  p chet
end
p "2 euler"
fibonachi

# 3 Найдите самый большой делитель сложного числа, являющийся простым числом.
def prost?(num)
  del = []
  2.upto(num) do |j|
    del << j if num%j == 0
  end
  true if (del.size == 1)
end

def find_del(num)
	mass_del = []
  max_del = 0
  2.upto(num-1) do |i|
  	if (num%i == 0) && prost?(i) 	  
      max_del = i
  	end
  end
  p max_del
end
p "3 euler"
find_del(13195)

# 4 Найдите самый большой палиндром, полученный произведением двух трёхзначных чисел.
def palindr
	second = 998
	sum = second
	while (sum.to_s.reverse.to_i != sum)
		sum = 999*second
		second -=1
		if (sum.to_s.reverse.to_i == sum)
			p  sum
		end
	end	
end
p "4 euler"
palindr

# 5 Какое самое маленькое число делится нацело на все числа от 1 до 20?

def loop_ost(min)
  1.upto(20) do |i|
   return false if (min%i > 0)
  end
  return true
end

def minim
  min = 1
  while !loop_ost(min)
  	min += 1
  end
p "min #{min}"
end
minim


# 6 Какова разность между суммой квадратов и квадратом суммы?
def sum_of_squares
  (1..100).map{ |i| i*i }.reduce(:+)
end

def square_of_sum
  (1..100).reduce(:+)**2
end

def diff
  p square_of_sum - sum_of_squares
end

diff

# 7 Какое число является 10001-ым простым числом?
def prost_count(big)
  num = 1
  big=1001
  while big != 0 do
    num += 1
    big -= 1 if prost?(num)    
  end
  p num
end

