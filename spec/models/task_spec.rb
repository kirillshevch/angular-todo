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
    let!(:task3) { FactoryGirl.create(:task, list_id: list) }
    let!(:task2) { FactoryGirl.create(:task, list_id: list) }
    let!(:task1) { FactoryGirl.create(:task, list_id: list) }

    it 'should reorder other tasks in the list when target_priority is set' do
      expect {
        task2.task_priority = 1
        task2.save!
      }.to change {[task1, task2, task3].map(&:reload).map(&:position)}.from([1, 2, 3]).to([2, 1, 3])
    end

  end
end
