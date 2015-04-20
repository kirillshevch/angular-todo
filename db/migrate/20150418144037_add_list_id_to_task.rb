class AddListIdToTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :completed
    add_column :tasks, :completed, :boolean, default: :false
    add_column :tasks, :list_id, :integer
  end
end
