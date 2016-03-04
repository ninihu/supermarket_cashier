
class Buy
  attr_accessor :product, :market, :number#, :total

  def initialize(market, barcode, number)
    @market = market
    @product = market.find_product(barcode)
    @number = number.to_i
  end

  #总价
  def total
    if @product.three_for_two?
      return (number_of_three_for_two * @product.price).to_f
    elsif @product.discount?
      return (original_total * @product.discount).to_f / 100
    else
      return original_total
    end
  end

  #买二赠1
  def three_for_two
    (@number / 3).to_i
  end
  
  #买二赠1
  def three_for_two
    (@number / 3).to_i
  end
  
  #买二赠1活动后的商品数量
  def number_of_three_for_two
    three_for_two * 2 + @number % 3
  end

  #原价
  def original_total
    (@product.price * @number).to_f
  end

  def save_money
    (original_total - total).round(2)
  end
end
