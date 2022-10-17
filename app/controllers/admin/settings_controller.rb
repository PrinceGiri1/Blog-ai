class Admin::SettingsController < Admin::ApplicationController
	def index
    @settings = Setting.all
  end
  def new
    @setting = Setting.new
  end
  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to admin_settings_path
    else
      render "new"
    end
  end
  private
  	def setting_params
    	params.require(:setting).permit(:blog_name, :post_per_page, :if_maintenance, :about)
  	end
end
