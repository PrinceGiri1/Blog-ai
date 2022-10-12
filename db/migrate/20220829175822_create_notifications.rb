class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :notifiable_type
      t.integer :notifiable_id

      t.timestamps
    end
  end
end
