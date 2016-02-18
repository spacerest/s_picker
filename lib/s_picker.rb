class StockPicker

   def days(stock_array)
     prices = stock_array.minmax # [low,high]
     buy_day = stock_array.index(prices[0])
     sell_day = stock_array.index(prices[-1])
     if stock_array[0] > stock_array[-1] and stock_array.length == 2
       "don't buy"
     elsif prices[0] == prices[1]
       "price hasn't changed"
     else
       if buy_day > sell_day #if buy day is after sell day
         new_buy = stock_array.sort[1]
         buy_day = stock_array.index(new_buy)
       end
       "buy: #{buy_day + 1}, sell: #{sell_day + 1}"
    end
  end

end
