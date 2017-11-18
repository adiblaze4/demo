$LOAD_PATH << '.'
require 'Buyer_seller_task'
require 'date'
#CLASS USER
class User
  include Handler
  attr_accessor :first_name , :last_name , :date_of_birth , :address , :role

  #constructor of class User
  def initialize(fn=nil , ln=nil , dob=nil , add=nil , r=nil)
    self.first_name = fn
    self.last_name = ln
    self.date_of_birth = dob
    self.address = add
    self.role = role
  end

  # using singleton class to refrence single instance.we define it only for info object
  #if we use self.class, then all instances get the method & we only want it for info instance.
  #The block you pass to class_eval is evaluated in the context of the module.
  def return_obj(key, val)
    singleton_class.class_eval { attr_accessor "#{key.to_s}" }
    send("#{key.to_s}=", val)
  end

  #class method for all user information
  def self.user_detail
    puts "User information -:"
    @@users_obj
  end

  #class method for Buyer and seller fullname
  def self.buyer_seller_fullname
    @@users_obj
    puts "User fullname list -:"
    puts @@users_obj.collect(&:full_name)
    # @@users_obj.each do |user|
    #   puts "#{user.first_name} #{user.last_name} \n"
    # end
    puts "-----------------------------------------------------------------------------"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  #Class method for finding User alex in buyer and seller list
  def self.find_user_alex
    puts "alex in buyer and seller list are-:"
    @@users_obj
  end

  #class method for counting no. of alex in buyer seller list
  def self.no_of_alex
    users = []
    @@users_obj.each do |user|
      if user.first_name == 'alex'
        users << user
      end
    end
    users
  end

  def buyer_seller_age_calculate
    puts "Age of #{self.first_name} #{self.last_name} is #{age_calculate} years \n"
    puts "-----------------------------------------------------------------------------"
  end

  # calculating age of user sundar pichai
  def age_calculate
    date =  self.date_of_birth
    d1 = Date.parse date
    d2 = Date.today
    age = d2.year - d1.year
    age
  end

  #making this method for using DRY concept
  def self.get_users_objects(hash)
    @@users_obj = []
    hash.each do |h|
      user = Handler.make_object(h,self)
      @@users_obj << user
    end
  end
end

users = [
  {:first_name => 'alex', :last_name => 'newman',  :date_of_birth => '01-05-1982',  :address => 'sapna sangeeta', :role => 'buyer'},
  {:first_name => 'alex', :last_name => 'Panc',  :date_of_birth => '12-04-1990',  :address => 'bhanwar kua', :role => 'seller'},
  {:first_name => 'Meena', :last_name => 'Pallanipppan',  :date_of_birth => '03-02-1988',  :address => 'sapna sangeeta', :role => 'seller'},
  {:first_name => 'Prabhu', :last_name => 'Sharma',  :date_of_birth => '11-02-1992',  :address => 'geeta bhawan', :role => 'seller'},
  {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
]

User.get_users_objects(users)

users1 = User.user_detail
users1.each do |user|
  puts "#{user.first_name} #{user.last_name} #{user.date_of_birth} #{user.address} #{user.role} \n"
end
puts "-----------------------------------------------------------------------------"

h1 = {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
user = User.new( h1[:first_name], h1[:last_name], h1[:date_of_birth],h1[:address], h1[:role])
user.buyer_seller_age_calculate

User.buyer_seller_fullname

users2 = User.find_user_alex
users2.each do |user|
  puts "#{user.first_name} #{user.last_name}\n" if user.first_name == "alex"
end
puts "-----------------------------------------------------------------------------"

users = User.no_of_alex
puts "No. of buyer and seller whose first name is alex is #{users.count}"
puts "-----------------------------------------------------------------------------"
