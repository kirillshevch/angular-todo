class FileStore < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :comment
end
