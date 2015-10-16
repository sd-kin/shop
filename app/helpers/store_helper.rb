module StoreHelper

	def display_count
		"this page viewed #{session[:counter]} times" if session[:counter]>5
	end
end
