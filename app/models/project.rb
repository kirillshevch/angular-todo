class Project < ActiveRecord::Base
  belongs_to :user

  before_save :default_name

  default_scope -> { order('id DESC') }

  private

    def default_name
      self.name ||= "New project"
    end
end
