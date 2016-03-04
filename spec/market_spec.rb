#encoding: utf-8
require 'spec_helper'
Rspec.describe Market do 
  subject {Market.new("Suppppppmaket").init_products}
  
  describe "#The class of Market goods" do
    it "6" do
      subject.products.size.should eql(6)
    end
  end
  
  describe "Setting Market goods" do
    
    it "PRODUCT0006 to discount" do
      @product = subject.set_three_for_two("PRODUCT0002")
      @product.three_for_two?.should be_true
    end
    
    it "PRODUCT0002 to three_for_two" do
      @product = subject.set_discount("PRODUCT0002")
      @product.discount?.should be_true
    end
    
  end
  
end