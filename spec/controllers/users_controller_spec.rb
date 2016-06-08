require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  # let(:user_attributes) { { email: FFaker::Internet.email, first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name } }

  describe 'POST #create' do
    before do
      @user_attributes = FactoryGirl.attributes_for :user
      post :create, { user: @user_attributes }, format: :json
    end

    it 'renders the user in json format'
    it { should respond_with 201 }
  end
end
