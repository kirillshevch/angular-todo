require 'rails_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    let(:user) { FactoryGirl.create(:user) }
    let(:list) { FactoryGirl.create(:list, user_id: user.id) }
    let(:task) { FactoryGirl.create(:task, list_id: list.id) }
    let(:comment) { FactoryGirl.create(:comment, task_id: task.id) }
    let(:file) { FactoryGirl.create(:file_store, comment_id: comment.id) }
    subject(:ability) { Ability.new(user) }

    it { expect(ability).to be_able_to(:manage, list) }
    it { expect(ability).to be_able_to(:manage, task) }
    it { expect(ability).to be_able_to(:create, comment) }
    it { expect(ability).to be_able_to(:destroy, comment) }
    it { expect(ability).to be_able_to(:create, file) }

    context 'cannot' do
      let(:user1) { FactoryGirl.create(:user) }
      subject(:ability) { Ability.new(user1) }

      it { expect(ability).not_to be_able_to(:manage, list) }
      it { expect(ability).not_to be_able_to(:manage, task) }
      it { expect(ability).not_to be_able_to(:create, comment) }
      it { expect(ability).not_to be_able_to(:destroy, comment) }
      it { expect(ability).not_to be_able_to(:create, file) }
    end
  end
end