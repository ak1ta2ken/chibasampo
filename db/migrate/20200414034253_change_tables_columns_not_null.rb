class ChangeTablesColumnsNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :admin, false
    change_column_null :strolls, :title, false
    change_column_null :strolls, :content, false
    change_column_null :strolls, :user_id, false
    change_column_null :labelings, :user_id, false
    change_column_null :labelings, :label_id, false
    change_column_null :labels, :label_name, false
    change_column_null :favorites, :user_id, false
    change_column_null :favorites, :stroll_id, false
    change_column_null :comments, :content, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :stroll_id, false
  end
end
