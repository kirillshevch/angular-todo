require 'rails_helper'
include OmniauthHelper

RSpec.describe User, type: :model do
  context '.from_omniauth' do
    context 'user exist' do
      let!(:user) { FactoryGirl.create(:user, provider: set_omniauth.provider, uid: set_omniauth.uid) }

      it 'returns first User' do
        expect(User.from_omniauth(set_omniauth)).to eq(user)
      end
    end

    context 'user not exist' do

      it 'returns instance created new User' do
        expect(User.from_omniauth(set_omniauth)).to be_instance_of(User)
      end
    end
  end
end
