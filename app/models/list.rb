class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :delete_all

  before_save :default_name

  default_scope -> { order('id DESC') }

  private

    def default_name
      self.name ||= "New list"
    end
end
