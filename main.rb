require './product.rb'
require './buy.rb'
require './market.rb'
require './order.rb'
#初始化商城商品
market = Market.new.init_products

# products = market.products
#设置商品的优惠活动
market.set_discount('PRODUCT0001')
market.set_three_for_two('PRODUCT0005')
market.set_three_for_two('PRODUCT0006')
market.set_discount('PRODUCT0006')
#购买
input = ['PRODUCT0001',
         'PRODUCT0001',
         'PRODUCT0003-2',
         'PRODUCT0005-3',
          'PRODUCT0006-8']
order = Order.new(market, input)


order.output
