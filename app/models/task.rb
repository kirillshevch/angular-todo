class Task < ActiveRecord::Base
  belongs_to :list

  default_scope -> { order('id DESC') }
end
