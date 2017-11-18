$LOAD_PATH << '.'
require 'user'

#CLASS SELLER
class Seller < User
  def self.seller_list
    puts "Seller name list -: "
    sellers = []
    @@users_obj.each do |user|
      sellers << user if user.role == "buyer"
    end
    sellers
  end
end

sellers = Seller.seller_list
sellers.each do |user|
  puts "#{user.first_name} #{user.last_name}\n"
end