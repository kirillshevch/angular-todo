require 'file_size_validator'

class FileStore < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :comment

  validates :file_name, length: { maximum: 500 }, presence: true
  validates :file, file_size: { maximum: 15.megabytes.to_i }
end
