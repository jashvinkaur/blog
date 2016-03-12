module UserHelper
	def find_user id
		User.find(id) rescue 'anonymous'
	end

end
