require 'rails_helper'

RSpec.describe FileStore, type: :model do
  let(:file_store) { FactoryGirl.create(:file_store) }

  context 'associations' do
    it { expect(file_store).to belong_to(:comment) }
  end

  context 'valdations' do
    it { expect(file_store).to validate_presence_of(:file_name) }
    it { expect(file_store).to validate_length_of(:file_name).is_at_most(500) }
  end
end
