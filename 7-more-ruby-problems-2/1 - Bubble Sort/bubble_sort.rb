def bubble_sort(numbers)
	(numbers.length-1).times{
		for i in 0...numbers.length-1
			if numbers[i] > numbers[i+1]
				numbers[i], numbers[i+1] = numbers[i+1], numbers[i]
			end
		end
	}
	return numbers
end

#Sorting by word length
def bubble_sort_by(numbers)
	(numbers.length-1).times{
		for i in 0...numbers.length-1
			if yield(numbers[i], numbers[i+1]) > 0
				numbers[i], numbers[i+1] = numbers[i+1], numbers[i]
			end
		end
	}
	return numbers
end

puts bubble_sort([4,3,78,2,0,2])
puts bubble_sort_by(["hi","hello","hey"]) {|left, right|
	left.length - right.length
}