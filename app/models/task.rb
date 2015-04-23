class Task < ActiveRecord::Base
  belongs_to :list

  default_scope -> { order('position ASC') }

  acts_as_list scope: :list, add_new_at: :top

  def task_priority=(value)
    insert_at(value.to_i)
  end
end
