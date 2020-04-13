class AddColumnsToStrolls < ActiveRecord::Migration[5.2]
  def change
    add_column :strolls, :created_at, :datetime, null: false
    add_column :strolls, :updated_at, :datetime, null: false
  end
end
