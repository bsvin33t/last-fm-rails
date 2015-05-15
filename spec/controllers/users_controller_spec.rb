require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context 'guest user' do
    describe 'GET show' do
      it 'should not be accessible by a user who is not logged in' do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'signed in user' do

    let (:user) { create(:user) }
    before(:each) { sign_in user }

    describe 'GET show' do
      it 'should not be accessible by a user who is not logged in' do
        get :show
        expect(response).to be_ok
      end
    end
  end
end