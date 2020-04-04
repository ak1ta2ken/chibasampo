class CreateStrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :strolls do |t|
      t.text :title
      t.text :content
      t.text :image
    end
  end
end
