def stock_picker(prices)
	highest_profit = 0
	buy, sell = -1, -1
	for i in 0..prices.length-1
		for j in i+1..prices.length-1
			if (prices[j] - prices[i] > highest_profit)
				highest_profit = prices[j] - prices[i]
				buy = i
				sell = j
			end
		end
	end
	return [buy, sell]
end

print stock_picker([17,3,6,9,15,8,6,1,10])