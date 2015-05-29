def substring(words, dict)
	words = words.downcase
	ret_hash = {}
	for x in 0...dict.length
		if words.include?(dict[x])
			#Check if entire value of 'words' is equal to a 'dict' element
			if (words == dict[x])
				ret_hash[dict[x]] = 1
			#Check if last part of 'words' is the searched 'dict' element
			elsif (words.reverse[0...dict[x].length] == dict[x].reverse)
				ret_hash[dict[x]] = words.split(dict[x]).length
			#Not an edge case
			else
				ret_hash[dict[x]] = words.split(dict[x]).length - 1
			end
		end
	end
	return ret_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substring("below", dictionary)
puts substring("Howdy partner, sit down! How's it going?", dictionary)