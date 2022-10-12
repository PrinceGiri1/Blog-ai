class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :full_name
      t.string :email
      t.string :message
      t.boolean :status
      t.integer :post_id

      t.timestamps
    end
  end
end
