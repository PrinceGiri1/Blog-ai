class AddCulumnToNotification < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :status, :boolean
  end
end
