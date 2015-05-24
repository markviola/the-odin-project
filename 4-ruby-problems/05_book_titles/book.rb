class Book
	attr_accessor :title
	def title= (phrase)
		special = ['the', 'a', 'an', 'and', 'in', 'of']
		phrase_words = phrase.split
		phrase_words[0] = capitalize(phrase_words[0])
		for i in (1..phrase_words.length-1)
			if (!special.include?(phrase_words[i]))
				phrase_words[i] = capitalize(phrase_words[i])
			end
		end
		@title = phrase_words.join(' ')
	end

	def capitalize(word)
		word[0] = word[0].upcase
		return word
	end

end