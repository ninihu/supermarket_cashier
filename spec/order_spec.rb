#encoding: utf-8
require 'spec_helper'
Rspec.describe Order do 
  before :each do
    market = Market.new("SuperMarket").init_products
    market.set_discount('PRODUCT0001')
    market.set_three_for_two('PRODUCT0005')
    market.set_three_for_two('PRODUCT0006')
    market.set_discount('PRODUCT0006')
    input = ['PRODUCT0001',
         'PRODUCT0001',
         'PRODUCT0003-2',
         'PRODUCT0005-3',
          'PRODUCT0006-8']
    @order = Order.new(market, input)
  end
  
  
  describe "订单商品详细" do
    describe ".商品数量信息" do
      context "#商品总数" do 
        it "15" do 
          @order.total_num.should eql(15)
        end
      end
      
      context "#买二赠一数" do 
        it "2" do 
          @order.three_for_two_buys.size.should eql(2)
        end
      end
    end
    
    describe ".商品价格信息" do
      context "#原价" do 
        it "￥542.0" do 
          @order.original_total.should eql(542.0)
        end
      end
      
      context "#折后价" do 
        it "￥391.65" do 
          @order.total.should eql(391.65)
        end
      end
      
      context "#节省" do 
        it "￥150.35" do 
          @order.save_money.should eql(150.35)
        end
      end
    end
    
  end
  
end