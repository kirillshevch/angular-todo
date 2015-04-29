class Comment < ActiveRecord::Base
  belongs_to :task

  has_many :file_stores, dependent: :delete_all
end
