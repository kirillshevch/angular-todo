class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :delete_all

  before_save :default_name

  default_scope -> { order('id DESC') }

  validates :name, length: { maximum: 500 }

  private

    def default_name
      self.name ||= "New list"
    end
end
