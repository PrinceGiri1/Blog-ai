class AddAboutInSetting < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :about, :text
  end
end
