require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do
  let(:list) { FactoryGirl.create(:list) }
  let!(:task) { FactoryGirl.create(:task, list_id: list.id) }

  before do
    create_ability!
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive_message_chain(:tasks, :build).and_return task
        allow(task).to receive(:save).and_return true
      end

      it 'renders json task' do
        post :create, format: :json, list_id: list.id, name: 'test'
        expect(response.body).to eq(task.to_json)
      end
    end

    context 'with invalid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive_message_chain(:tasks, :build).and_return task
        allow(task).to receive(:save).and_return false
      end

      it 'response with 422' do
        post :create, format: :json, list_id: list.id, name: ''
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      before do
        allow(Task).to receive(:find).and_return task
        allow(task).to receive(:update).and_return true
      end

      it 'renders nothing' do
        patch :update, format: :json, list_id: list.id, id: task.id
        expect(response.body).to eq ''
      end
    end

    context 'with invalid params' do
      before do
        allow(Task).to receive(:find).and_return task
        allow(task).to receive(:update).and_return true
      end

      it 'response with 422' do
        post :create, format: :json, list_id: list.id, name: ''
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid params' do
      before do
        allow(Task).to receive(:find).and_return task
        allow(task).to receive(:destroy).and_return true
      end

      it 'renders nothing' do
        delete :destroy, format: :json, list_id: list.id, id: task.id
        expect(response.body).to eq ''
      end
    end

    context 'with invalid params' do
      before do
        allow(Task).to receive(:find).and_return task
        allow(task).to receive(:destroy).and_return true
      end

      it 'response with 422' do
        post :create, format: :json, list_id: list.id, name: ''
        expect(response.status).to eq(422)
      end
    end
  end
end