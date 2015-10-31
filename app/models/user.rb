class User < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_secure_password

  after_destroy :ensure_an_admin_remains

   private    

  def ensure_an_admin_remains        
  	  

  		raise "Last user can't be destroed" if User.count < 1  

  end

	
end

 
