class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :blog_name
      t.integer :post_per_page
      t.boolean :if_maintenance

      t.timestamps
    end
  end
end
