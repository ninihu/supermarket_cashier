class Product
  @@discount = [:discount, :three_for_two] #折扣，买二赠一
  @@discount_percent = 95

  attr_accessor :name, :barcode, :price, :discount#, :promotions
  #商品名，条形码，单价, 活动
  def initialize(name, barcode, price, promotions = {})
    @name = name
    @barcode = barcode
    @price = price
    @promotions = promotions || {}
    @discount = discount? ? 100 : @@discount_percent
  end

  #设置商品为折扣商品，params: 折扣，默认95折
  def set_discount(discount = @@discount_percent)
    @discount = discount
    @promotions[@@discount[0]] = true
  end

  #清除折扣
  # def clear_discount
  #   @discount = 100
  #   @promotions[@@discount[0]] = false
  # end

  #设置买二赠一活动
  def set_three_for_two
    @promotions[@@discount[1]] = true
  end

  # def clear_three_for_two
  #   @promotions[@@discount[1]] = false
  # end

  #是否为折扣商品,如果是买二赠一商品，则不算折扣
  def discount?
    !three_for_two? && @promotions[@@discount[0]]
  end

  #是否为买二赠一商品
  def three_for_two?
    @promotions[@@discount[1]]
  end


end
