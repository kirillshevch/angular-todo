require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  let(:list) { FactoryGirl.create(:list) }
  let(:task) { FactoryGirl.create(:task, list_id: list.id) }
  let!(:comment) { FactoryGirl.create(:comment, task_id: task.id) }

  before do
    create_ability!
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive_message_chain(:tasks, :find).and_return task
        allow(task).to receive_message_chain(:comments, :build).and_return comment
        allow(comment).to receive(:save).and_return true
      end

      it 'renders json comment' do
        post :create, format: :json, list_id: list.id, task_id: task.id
        expect(response.body).to eq(comment.to_json)
      end
    end

    context 'with invalid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive_message_chain(:tasks, :find).and_return task
        allow(task).to receive_message_chain(:comments, :build).and_return comment
        allow(comment).to receive(:save).and_return false
      end

      it 'response with 422' do
        post :create, format: :json, list_id: list.id, task_id: task.id
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid params' do
      before do
        allow(Comment).to receive(:find).and_return comment
        allow(comment).to receive(:destroy).and_return true
      end

      it 'renders nothing' do
        delete :destroy, format: :json, list_id: list.id, task_id: task.id, id: comment.id
        expect(response.body).to eq ''
      end
    end

    context 'with invalid params' do
      before do
        allow(Comment).to receive(:find).and_return comment
        allow(comment).to receive(:destroy).and_return false
      end

      it 'response with 422' do
        delete :destroy, format: :json, list_id: list.id, task_id: task.id, id: comment.id
        expect(response.status).to eq(422)
      end
    end
  end
end