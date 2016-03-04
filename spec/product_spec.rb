require 'spec_helper'
RSpec.describe Product do
  subject {Product.new("apple", "PRODUCT0001", '5.5')}
  describe "#discount" do
    context "apple has no discount" do
      it "no discount" do
        subject.discount?.should be_false
      end
    end
  
    context "setting the apple's discount" do
      it ".discount 50%" do
        subject.set_discount(50)
        subject.discount.should eql(50)
      end
    end
  end
  
  describe "#three_for_two" do
    context "apple has no three_for_two" do
      it "no three_for_two" do
        subject.three_for_two?.should be_false
      end
    end
  
    context "setting the apple's three_for_two" do
      it ".three_for_two" do
        subject.set_three_for_two
        subject.three_for_two?.should be_true
      end
    end
  end
end