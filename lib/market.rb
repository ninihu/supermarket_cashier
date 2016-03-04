#encoding: utf-8
#超市
class Market

  #超市名,超市商品
  attr_reader :products, :name
  def initialize(name, products = [])
    @name = name
    @products = products
  end

  def init_products
    @name = '有钱赚01店'
    @products = [['苹果', 'PRODUCT0001', 3.5],
      ['羽毛球', 'PRODUCT0002', 1],
      ['可口可乐', 'PRODUCT0003', 2.5],
      ['瓜子', 'PRODUCT0004', 3.5],
      ['拖把', 'PRODUCT0005', 70],
      ['洗洁精', 'PRODUCT0006', 40]].map do |p|
        Product.new(p[0], p[1], p[2], p[3])
    end
    return self
  end

  #设置商品为折扣商品,
  def set_discount(barcode)
    product = find_product(barcode)
    product.set_discount
    return product
  end

  def set_three_for_two(barcode)
    product = find_product(barcode)
    product.set_three_for_two
    return product
  end

  #查找商品
  def find_product(barcode)
    product = @products.find{|p| p.barcode == barcode}
    product || (raise ProductNotFoundException)
  end
  #TODO 添加商品(条形码唯一)，删除商品
end
