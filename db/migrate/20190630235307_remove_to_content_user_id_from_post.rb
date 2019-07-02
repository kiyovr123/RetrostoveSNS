class RemoveToContentUserIdFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts,:user_id,:string
    remove_column :posts,:content,:text
  end
end
