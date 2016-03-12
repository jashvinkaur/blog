class Post < ActiveRecord::Base
	validates :title, :description,  :presence => true
	default_scope {order('created_at DESC')}

	belongs_to :user
	has_many :comments
end
