class AddFileNameToFileStores < ActiveRecord::Migration
  def change
    add_column :file_stores, :file_name, :string
  end
end
