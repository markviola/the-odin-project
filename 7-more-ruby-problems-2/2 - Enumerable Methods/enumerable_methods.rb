module Enumerable
	def my_each
		for value in self
			yield(value)
		end
		return self
	end

	def my_each_with_index
		for i in 0...self.length
			yield(self[i], i)
		end
		return self
	end

	def my_select
		ret_array = []
		self.my_each {|value|
			ret_array << value if yield(value)
		}
		return ret_array
	end

	def my_all?
		self.my_each {|value| return false unless yield(value)}
		return true
	end

	def my_any?
		self.my_each {|value| return true if yield(value)}
	end

	def my_none?
		self.my_each {|value| return false if yield(value)}
		return true
	end

	def my_count(arg=nil)
		count = 0
		if arg.nil? && block_given?
			self.my_each{|value| count += 1 if yield(value)}
			return count
		elsif arg.nil?
			self.my_each{|value| count += 1}
			return count
		else 
			self.my_each{|value| count += 1 if value == arg}
			return count
		end
	end

	def my_map
		ret_array = []
		self.my_each{|value| ret_array << yield(value)}
		return ret_array
	end

	def my_inject
		current = nil
		self.my_each{|value|
			if current.nil?
				current = value
			else 
				current = yield(current, value)
			end
		}
		return current
	end
end

answers = []
#Calling my_each
answers << [1,2,3,4].my_each{|num|
	puts num.to_s
}

#Calling my_each_with_index
answers << Hash.new
%w(cat dog wombat).my_each_with_index{|item, index|
	answers[1][item] = index
}

#Calling my_select
answers << [1,2,3,4,5].my_select{|num| num.even?}

#Calling my_all?
answers << %w[ant bear cat].my_all?{|word| word.length >= 3}

#Calling my_any?
answers << %w[ant bear cat].my_any?{|word| word.length >= 3}

#Calling my_none?
answers << %w{ant bear cat}.my_none?{|word| word.length >= 4}

#Calling my_count
array = [1, 2, 4, 2]
answers << array.my_count
answers << array.my_count(2)
answers << array.my_count{|x| x%2==0}

#Calling my_map
answers << (1..4).my_map{|i| i*i}

#Calling my_inject
answers << (5..10).my_inject{|sum, n| sum + n}
answers << (5..10).my_inject{|product, n| product * n}
answers << %w{cat sheep bear}.my_inject do |memo, word|
	memo.length > word.length ? memo : word
end


answers.my_each{|value|
	print value
	puts
}