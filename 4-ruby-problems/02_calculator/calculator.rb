def add(num1, num2)
	return num1 + num2
end

def subtract(num1, num2)
	return num1 - num2
end

def sum(numbers)
	total = 0
	for num in numbers
		total += num
	end
	return total
end

def multiply(numbers)
	if numbers.length > 0
		total = 1
		for num in numbers
			total *= num
		end
	end
	return total
end

def power(base, exp)
	if exp == 0
		return 1
	elsif exp > 0
		total = 1
		for i in 1..exp
			total *= base
		end
	elsif exp < 1
		total = 1
		for i in exp
			total *= base
		end
		total = 1.0/total
	end
	return total
end

def factorial(number)
	if (number == 0)
		return 1
	elsif (number >= 1)
		total = 1
		for i in 1..number
			total *= i
		end
		return total
	end
	return -1
end
