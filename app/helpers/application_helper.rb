module ApplicationHelper

	def hidden_div_if(condition, attributes = {}, &block)
	
		if condition
			 attributes["style"] = "display: none"
		else
			attributes["style"] = "display: inline"
		end
	
	content_tag("div", attributes, &block)
	
	end

	def login_button

		if session[:user_id] 
			button_to 'Logout', logout_path, method: :delete, class: "btn btn-default navbar-btn"
		else 
			 button_to 'Login', login_path, method: :get, class: "btn btn-default navbar-btn" 
		end

	end

	

end
