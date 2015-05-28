def caesar_cipher (message, delta)
	cipher_msg = ''
	for i in 0..message.length-1
		cipher_msg += new_char(message[i], delta)
	end
	return cipher_msg
end

def new_char(letter, delta)
	ascii = letter.downcase.ord 		#letter to ASCII value
	if (ascii >= 97 and ascii <= 122)
		if (ascii + delta > 122)
			ret_letter = ((((ascii + delta) - 122) % 26) + 96).chr
		else
			ret_letter = (ascii + delta).chr
		end
		return letter == letter.upcase ? ret_letter.upcase : ret_letter
	end
	return letter
end

print caesar_cipher("What a string!", 5)