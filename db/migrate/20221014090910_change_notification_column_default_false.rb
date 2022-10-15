class ChangeNotificationColumnDefaultFalse < ActiveRecord::Migration[7.0]
  def change
    change_column_default :notifications, :status, false
  end
end
