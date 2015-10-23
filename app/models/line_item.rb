class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
  	
  	product.price * quantity 

  end

  def plus_one

  	quantity+=1 if quantity

  end 

  def minus_one

  	quantity+=1 if quantity
  	
  end
  
end
