module UseCount

	extend ActiveSupport::Concern

	private

	def set_count

		session[:counter] = 0 unless session[:counter]

		session[:counter]+=1

	end

	def reset_count
		session[:counter] = 0
	end

end