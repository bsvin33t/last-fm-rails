require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def after_sign_in_path_for(resource)
      super resource
    end
  end

  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  describe 'After sigin-in' do
    it 'redirects to the user show page' do
      expect(controller.after_sign_in_path_for(@user)).to eq(user_path(@user.id))
    end
  end
end