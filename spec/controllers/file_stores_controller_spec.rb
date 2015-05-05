require 'rails_helper'

RSpec.describe FileStoresController, type: :controller do
  let(:comment) { FactoryGirl.create(:comment) }
  let!(:file) { FactoryGirl.create(:file_store, comment_id: comment.id) }
  let(:file_params) { FactoryGirl.attributes_for(:file_store) }

  before do
    create_ability!
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        allow(Comment).to receive(:find).and_return comment
        allow(comment).to receive_message_chain(:file_stores, :build).and_return file
        allow(file).to receive(:save).and_return true
      end

      it 'renders file_stores/create.json.jbuilder template' do
        post :create, file_params
        expect(response).to render_template 'file_stores/create.json.jbuilder'
      end
    end

    context 'with invalid params' do
      before do
        allow(Comment).to receive(:find).and_return comment
        allow(comment).to receive_message_chain(:file_stores, :build).and_return file
        allow(file).to receive(:save).and_return false
      end

      it 'response with 422' do
        post :create
        expect(response.status).to eq(422)
      end
    end
  end
end