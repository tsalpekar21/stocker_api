require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user_attributes) { FactoryGirl.attributes_for :user }
  before do
    post '/api/users', { user: user_attributes }, format: :json
    post '/api/login', { user: user_attributes.slice(:email, :password)}, format: :json
    @user = json_response(response)[:user]
  end

  context 'with a created user' do
    it 'should be able to hit protected routes' do
      put "/api/user/#{@user[:id]}", { user: {email: 'new_email@thisemail.com'} }, { 'HTTP_AUTHORIZATION' => @user[:access_token],
                                                                                     'HTTP_ACCEPT' => 'application/json'  }
      expect(response.status).to eq(200)
    end
  end
end
