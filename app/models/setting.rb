class Setting < ApplicationRecord
	validates :blog_name, :post_per_page, :about, presence:true
	validates :about, length: { maximum: 215 }
	
end
