#encoding: utf-8
require 'spec_helper'
Rspec.describe Buy do 
  before :each do
    [['苹果', 'PRODUCT0001', 3.5],
      ['羽毛球', 'PRODUCT0002', 1],
      ['可口可乐', 'PRODUCT0003', 2.5],
      ['瓜子', 'PRODUCT0004', 3.5],
      ['拖把', 'PRODUCT0005', 70],
      ['洗洁精', 'PRODUCT0006', 40]]
    @market = Market.new("有钱赚店").init_products
    @market.set_three_for_two("PRODUCT0003")
    @market.set_discount("PRODUCT0003")
    @market.set_discount("PRODUCT0002")
    @market.set_three_for_two("PRODUCT0001")
    @buy_cola = Buy.new(@market,'PRODUCT0003', 7)
    @buy_apple = Buy.new(@market,'PRODUCT0001', 5)
    @buy_wash = Buy.new(@market,'PRODUCT0006', 1)
    @buy_nuts = Buy.new(@market,'PRODUCT0004', 3)
  end
  
  describe "购物~~" do
    describe "买7厅可口可乐，又有买二赠一，又在打折" do
      context "#到底几个" do
        it "5个" do
           @buy_cola.number_of_three_for_two.should eql(5)
        end
      end
      
      context "#价格" do
        it "￥12.50" do
          @buy_cola.total.should eql(12.5)
        end
      end
    end
    
    describe "买5个苹果，因为他有买二赠一" do
      context "#到底几个" do
        it "4个" do
          @buy_apple.number_of_three_for_two.should eql(4)
        end
      end
      
      context "#价格" do
        it "￥14.00" do
          @buy_apple.total.should eql(14.0)
        end
      end
    end
    
    describe "买个打折的洗洁精" do
      context "#到底几个" do
        it "1个" do
          @buy_wash.number.should eql(1)
        end
      end
      
      context "#价格" do
        it "￥40.00" do
           @buy_wash.total.should eql(40.0)
        end
      end
    end
    
    describe "买3包瓜子吧，没有活动，orz" do
      context "#到底几个" do
        it "3个" do
          @buy_nuts.number.should eql(3)
        end
      end
      
      context "#价格" do
        it "￥10.5" do
          @buy_nuts.total.should eql(10.5)
        end
      end
    end
    
  end
  
end