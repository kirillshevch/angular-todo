require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do

  let(:lists) { FactoryGirl.create_list(:list, 3) }
  let(:list) { FactoryGirl.create(:list) }

  before do
    create_ability!
  end

  describe 'GET #index' do
    it 'assigns @lists' do
      get :index, format: :json
      expect(assigns(:lists)).to eq(lists.reverse)
    end

    it 'renders template lists index' do
      get :index, format: :json
      expect(response).to render_template('api/lists/index')
    end
  end

  describe 'POST #create' do
    before do
      allow(List).to receive(:new).and_return list
      allow(list).to receive(:save).and_return true
    end

    it 'renders :json' do
      post :create, format: :json
      expect(response.body).to eq(list.to_json)
    end

    it 'assigns @list' do
      post :create, format: :json
      expect(assigns(:list)).to eq(list)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive(:update).and_return true
      end

      it 'renders nothing' do
        patch :update, format: :json, id: list.id, name: 'test name'
        expect(response.body).to eq ''
      end
    end

    context 'with invalid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive(:update).and_return false
      end

      it 'response with 422' do
        patch :update, format: :json, id: list.id, name: Faker::Lorem.characters(500)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive(:destroy).and_return true
      end

      it 'returns nothing' do
        delete :destroy, format: :json, id: list.id
        expect(response.body).to eq ''
      end
    end

    context 'with invalid params' do
      before do
        allow(List).to receive(:find).and_return list
        allow(list).to receive(:destroy).and_return false
      end

      it 'response with 422' do
        delete :destroy, format: :json, id: list.id
        expect(response.status).to eq(422)
      end
    end
  end

end