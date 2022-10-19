class ApplicationController < ActionController::Base
	layout 'navbar'
	before_action :blog_setting
	
	def blog_setting
		@blog_setting = Setting.first
	end
end
