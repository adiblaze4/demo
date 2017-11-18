# Module handler to handle User ,  buyer ,Seller , product
module Handler
  # Dynamic hash for getting value of user , product , buyer , seller
  def self.make_object(hash, klass_name)
    info = klass_name.new
    hash.each do |key, val|
      info.return_obj(key, val)
    end
    info
  end
end

