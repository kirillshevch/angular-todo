class AddCommentIdToFileStore < ActiveRecord::Migration
  def change
    add_column :file_stores, :comment_id, :integer
  end
end
