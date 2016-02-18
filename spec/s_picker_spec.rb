require 's_picker'
require 'spec_helper'

describe StockPicker do
  let (:stock_picker) {StockPicker.new}
  context "return days for "
    it "two stocks if in ascending order" do
        expect(stock_picker.days([4,5])).to eq "buy: 1, sell: 2"
      end

      it "two stocks if in descending order" do
        expect(stock_picker.days([5,4])).to eq "don't buy"
      end

      it "two stocks if no price change" do
        expect(stock_picker.days([4,4])).to eq "price hasn't changed"
      end

      it "3 stocks if already in ascending order" do
        expect(stock_picker.days([4,5,6])).to eq "buy: 1, sell: 3"
      end

      it "3 stocks if highest price is in the middle and lowest is end" do
        expect(stock_picker.days([6,7,5])).to eq "buy: 1, sell: 2"
      end

      it "first and last are equal but ascending in middle" do
        expect(stock_picker.days([4,5,6,4])).to eq  "buy: 1, sell: 3"
      end

      it "has two min-max pairs in the right order" do
          expect(stock_picker.days([3,5,1,2])).to eq "buy: 1, sell: 2"
      end
    end
