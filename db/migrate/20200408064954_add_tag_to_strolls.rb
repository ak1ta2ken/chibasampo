class AddTagToStrolls < ActiveRecord::Migration[5.2]
  def change
    add_column :strolls, :tag, :text 
  end
end
