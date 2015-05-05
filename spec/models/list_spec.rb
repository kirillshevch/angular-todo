require 'rails_helper'

RSpec.describe List, type: :model do
  context 'associations' do
    let(:list) { FactoryGirl.create(:list) }

    it { expect(list).to belong_to(:user) }
    it { expect(list).to have_many(:tasks) }
  end

  context 'validations' do
    let(:list) { FactoryGirl.create(:list) }

    it { expect(list).to validate_length_of(:name).is_at_most(500) }
  end

  context '.default_name' do
    context 'with default name' do
      let(:list) { List.new }

      it 'returns name new list' do
        expect(list.send(:default_name)).to eq 'New list'
      end
    end

    context 'with set name' do
      let(:list) { List.new(name: 'test name') }

      it 'returns name new list' do
        expect(list.send(:default_name)).to eq 'test name'
      end
    end
  end
end
