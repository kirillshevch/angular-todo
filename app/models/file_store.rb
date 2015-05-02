class FileStore < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :comment

  validates :file_name, length: { maximum: 500 }, presence: true
end
