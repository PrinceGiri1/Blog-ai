class ChangeTypeOfColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :status, :boolean, :default => false
  end
end
