require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryGirl.create(:comment) }

  context 'associations' do
    it { expect(comment).to belong_to(:task) }
    it { expect(comment).to have_many(:file_stores) }
  end

  context 'validations' do
    it { expect(comment).to validate_presence_of(:name) }
    it { expect(comment).to validate_length_of(:name).is_at_most(500) }
  end


end
