class Setting < ApplicationRecord
	validates :blog_name, :post_per_page, :about,presence:true
	validates_length_of :about, :maximum => 215
	has_many :posts
end
