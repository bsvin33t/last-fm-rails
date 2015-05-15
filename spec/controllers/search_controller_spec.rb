require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  context 'guest user' do
    describe 'POST create' do
      it 'should not be accessible by a user who is not logged in' do
        params = {search: {query: 'MyBand'}}
        post :create, params
        expect(response).to redirect_to(new_user_session_path)
      end
    end

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

    describe 'POST create' do
      it 'should return a resultant json that contains bands similar to the queried band' do
        VCR.use_cassette('Megadeth') do
          params = {search: {query: 'Megadeth'}}
          post :create, params
          expect(response.body).to include('Slayer', 'Metallica')
        end
      end

      describe 'GET show' do
        it 'should redirect to user show page' do
          get :show
          expect(response).to redirect_to(user_path)
        end
      end
    end
  end

end
