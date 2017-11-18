$LOAD_PATH << '.'
require 'Buyer_seller_task.rb'

#CLASS PRODUCT
class Product
  include Handler

  def return_obj(key, val)
    singleton_class.class_eval { attr_accessor "#{key.to_s}" }
    send("#{key.to_s}=", val)
  end

  def self.product_info
    puts "Product Name and Seller information -:"
    @@products_obj
  end

  def self.toys_total_price
    toys_price = 0
    @@products_obj.each do |product|

      if product.category == "toys"
        toys_price = toys_price + product.price
      end
    end
    puts "Sum of price of all the toys is -: #{toys_price}"
    puts "-----------------------------------------------------------------------------"
  end

  def self.buy_toys
    no_of_toys = 0
    amount = 1000
    puts "Toys details which sundar pichai can buy-:"
    @@products_obj.each do |product|

      if product.price < amount && product.category == "toys"
        no_of_toys = no_of_toys + 1
        amount = amount - product.price
        puts "#{product.name} = #{product.price}"
      end
    end
    puts "No of toys Sundar Pichai can buy from 1000 rs is -: #{no_of_toys}"
    puts "-----------------------------------------------------------------------------"
  end

  def self.get_products_objects(hash)
    @@products_obj = []
    hash.each do |h|
      product = Handler.make_object(h,self)
      @@products_obj << product
    end
  end
end

product_details = [
  {:name => 'bicycle', :seller => 'alex', :price => 3000, :category => 'vehicle'},
  {:name => 'car', :seller => 'meena', :price => 250000, :category => 'vehicle'},
  {:name => 'jeans', :seller => 'prabhu', :price => 1800, :category => 'clothes'},
  {:name => 'shirt', :seller => 'prabhu', :price => 700, :category => 'clothes'},
  {:name => 'blue shirt', :seller => 'prabhu', :price => 1200, :category => 'clothes'},
  {:name => 't-shirt', :seller => 'prabhu', :price => 600, :category => 'clothes'},
  {:name => 'capri', :seller => 'prabhu', :price => 300, :category => 'clothes'},
  {:name => 'bike', :seller => 'meena', :price => 60000, :category => 'vehicle'},
  {:name => 'scooter', :seller => 'meena', :price => 25000, :category => 'vehicle'},
  {:name => 'maruti', :seller => 'meena', :price => 400000, :category => 'vehicle'},
  {:name => 'auto', :seller => 'meena', :price => 100000, :category => 'vehicle'},
  {:name => 'sweter', :seller => 'prabhu', :price => 1200, :category => 'clothes'},
  {:name => 'jacket', :seller => 'prabhu', :price => 3500, :category => 'clothes'},
  {:name => 'hat', :seller => 'prabhu', :price => 400, :category =>'clothes'},
  {:name => 'doll', :seller => 'alex', :price => 350, :category => 'toys'},
  {:name => 'toy car', :seller => 'alex', :price => 250, :category => 'toys'},
  {:name => 'bat', :seller => 'alex', :price => 700, :category => 'toys'},
  {:name => 'ball', :seller => 'alex', :price => 20, :category => 'toys'},
  {:name => 'batman', :seller => 'alex', :price => 300, :category => 'toys'},
  {:name => 'barbi doll', :seller => 'alex', :price => 3000, :category => 'toys'}
]

Product.get_products_objects(product_details)

p1 = Product.product_info
p1.each do |product|
  puts "#{product.name} #{product.seller} #{product.price} #{product.category} \n"
end
puts "-----------------------------------------------------------------------------"

Product.toys_total_price

Product.buy_toys