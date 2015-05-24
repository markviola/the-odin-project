def echo(word)
	return word
end

def shout(word)
	return word.upcase
end

def repeat(word, times=2)
	str = ""
	for i in 1..times
		str += word + ' '
	end
	#Remove the extra ' ' and account for indexing
	str = str[0..(str.length - 2)] 
	return str
end

def start_of_word(word, num)
	return word[0..(num-1)]
end

def first_word(sentence)
	first = ''
	for i in 0..sentence.length-1
		if (sentence[i] == ' ')
			return first
		end
		first += sentence[i]
	end
	#Does not take into account puncuation
	return first[0..(first.length - 1)]
end

def titleize(title)
	small_words = ['and', 'over', 'the']
	cap_title = capitalize(first_word(title))
	title_words = title.split
	for i in 1..title_words.length-1
		if !small_words.include?(title_words[i])
			title_words[i] = capitalize(title_words[i])
		end
		cap_title += ' ' + title_words[i]
	end
	return cap_title
end

def capitalize(word)
	word[0] = word[0].upcase
	return word
end
