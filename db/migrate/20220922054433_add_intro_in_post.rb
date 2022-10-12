class AddIntroInPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :intro, :text
  end
end
