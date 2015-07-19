def fibs(num)
	if num == 1
		print '1'
	else
		prev, curr = 1, 1
		print prev.to_s + ' '
		print curr.to_s + ' '
		while num > 2
			prev, curr = curr, curr + prev
			print curr.to_s + ' '
			num -= 1
		end
	end
	puts ''
end

def fibs_rec(num)
	if num == 1
		return 1
	elsif num == 2
		return 1
	else 
		return fibs_rec(num-2) + fibs_rec(num-1)
	end
end

fibs(20)

for i in 1..20
	print fibs_rec(i).to_s + ' '
end