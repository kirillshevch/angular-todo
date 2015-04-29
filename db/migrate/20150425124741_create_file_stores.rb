class CreateFileStores < ActiveRecord::Migration
  def change
    create_table :file_stores do |t|
      t.string :file

      t.timestamps null: false
    end
  end
end
