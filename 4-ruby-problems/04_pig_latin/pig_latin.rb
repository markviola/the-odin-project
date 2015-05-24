def translate(phrase)
	new_phrase = ''
	phrase_words = phrase.split
	for i in 0..phrase_words.length-1
		new_phrase += translate_word(phrase_words[i]) + ' '
	end
	return new_phrase[0..(new_phrase.length-2)]
end

def translate_word(word)
	vowels = ['a', 'e', 'i', 'o', 'u']
	if (vowels.include?(word[0]))
		return word + 'ay'
	else
		current = word[0]
		for i in 1..(word.length-1)
			if (current[i-1] == 'q')
				if (word[i] == 'u')
					current += word[i]
				end
			elsif (!vowels.include?(word[i]))
				current += word[i]
			#Another vowel found after constonant sound
			else
				return word[i..(word.length-1)] + current + 'ay'
			end
		end
	end
end
