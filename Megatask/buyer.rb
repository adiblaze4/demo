$LOAD_PATH << '.'
require 'user'

# CLASS BUYER
class Buyer < User
  def buyer_fullname
    puts "Name of buyer is #{first_name} #{last_name}"
    puts "-----------------------------------------------------------------------------"
  end

  def self.buyer_list
    puts "Buyer name list -: "
    buyers = []
    @@users_obj.each do |user|
      buyers << user if user.role == "buyer"
    end
    buyers
  end
end

h1 = {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
buyer = Buyer.new( h1[:first_name], h1[:last_name], h1[:date_of_birth],h1[:address], h1[:role])
buyer.buyer_fullname

buyers = Buyer.buyer_list
buyers.each do |user|
  puts "#{user.first_name} #{user.last_name}\n"
end