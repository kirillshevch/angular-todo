require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { FactoryGirl.create(:task) }

  context 'associations' do
    it { expect(task).to belong_to(:list) }
    it { expect(task).to have_many(:comments) }
  end

  context 'validations' do
    it { expect(task).to validate_presence_of(:name) }
    it { expect(task).to validate_length_of(:name).is_at_most(500) }
  end

  context '.task_priority=' do
    let(:list) { FactoryGirl.create(:list) }
    let!(:task1) { FactoryGirl.create(:task, list_id: list) }
    let!(:task2) { FactoryGirl.create(:task, list_id: list) }
    let!(:task3) { FactoryGirl.create(:task, list_id: list) }

    #todo
  end
end
