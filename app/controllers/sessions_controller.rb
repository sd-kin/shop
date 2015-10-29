class SessionsController < ApplicationController

  skip_before_action :authorize
  before_action :set_admin, only: :new
  def new
  end

  def create 

  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id        
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Неверная комбинация имени и пароля"
    end  

  end

  def destroy

  	 session[:user_id] = nil
  	 redirect_to store_url, notice: "Bye!" 

  end

  private

  def set_admin

    User.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin') if User.all.empty?

  end


end
