def merge_sort(in_array)
	if in_array.length > 1
		left_arr = in_array[0...in_array.length/2]
		right_arr = in_array[in_array.length/2...in_array.length]
		merge_sort(left_arr)
		merge_sort(right_arr)
		merge(left_arr, right_arr, in_array)
	else 

	end
end

def merge(left_array, right_array, base_array)
	left_count, right_count, base_count = 0, 0, 0
	while (left_count < base_array.length/2 && right_count < base_array.length/2)
		if left_array[left_count] < right_array[right_count]
			base_array[base_count] = left_array[left_count]
			left_count += 1
		elsif
			base_array[base_count] = right_array[right_count]
			right_count += 1
		end
		base_count += 1
	end

	if left_count >= base_array.length/2
		for i in base_count...base_array.length
			base_array[i] = right_array[right_count]
			right_count += 1
		end
	else 
		for i in base_count...base_array.length
			base_array[i] = left_array[left_count]
			left_count += 1
		end
	end
end


in_array = [5, 2, 3, 1, 8, 6, 4, 5]
print "The input array: "
print in_array
puts
merge_sort(in_array)
print "The output array: "
print in_array