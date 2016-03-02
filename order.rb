#encoding: utf-8
require './market.rb'
require './buy.rb'
class Order
  #超市，购买的货物
  attr_reader :buys, :market
  class << self
    #整理输入的商品数据
    #['Product0001', 'Product0001-2', 'Product0002', 'Product002']
    # [['Product0001', 3], ['Product0002', 2]]
    def arrange(list)
      data = list.group_by{|i| i.split('-')[0]}
      data.map do |key, value|
        [key, sum(value)]
      end
    end

    #获取商品的总数，['Product0001', 'Product0001-2'] => 3
    def sum(array)
      array.map do |a|
        number = 1
        /[^\-]+\-(?<number>\d+)/ =~ a
        number || 1
      end.reduce(:+)
    end
  end

  #[product barcode]
  def initialize(market, list)
    # @buys = list.collect
    order = Order.arrange(list)
    @buys = order.map{|o| Buy.new(market, o[0], o[1])}
    @market = market
  end

  def output
    puts "*** <#{@market.name}> 购物清单 ***\n"
    @buys.each do |buy|
      puts "名称：#{buy.product.name},数量：#{buy.number},单价: #{buy.product.price}(元),小计：#{buy.total}(元) #{buy.product.discount? ? '节省' + buy.save_money.to_s + '(元)' : ''}\n"
    end
    puts '------------------------'
    if three_for_two_buys
      puts "买二赠一商品：\n"
      three_for_two_buys.each do |buy|
        puts "名称：#{buy.product.name}, 数量：#{buy.three_for_two}"
      end
      puts '------------------------'
    end
    puts "总计：#{total}(元)"
    puts "节省：#{save_money}(元)"
    puts '************************'
  end

  def total
    @buys.collect(&:total).reduce(:+)
  end

  def original_total
    @buys.collect(&:original_total).reduce(:+)
  end

  def save_money
    (original_total - total).round(2)
  end

  def three_for_two_buys
    @buys.select{|buy| buy.product.three_for_two?}
  end


end
