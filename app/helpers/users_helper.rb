module UsersHelper

	def edit_confirmation(user = nil, attributes = {}, &block)
  if user.id and current_page?(edit_user_path user)
	  attributes[:style] = 'display: inline-block'
	else
		attributes[:style] = 'display: none'
	end

	content_tag("div", attributes, &block)
end
	
end
