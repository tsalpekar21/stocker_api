require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }
  before do
    get '/api/login', { user: { email: user.email, password: user.password } }, format: :json
    @user = json_response(response)[:user]
  end

  context 'with a valid access token' do
    it 'should be able to hit protected routes' do
      put "/api/user/#{@user[:id]}", { user: {email: 'new_email@thisemail.com'} }, request_access_token_header(@user[:access_token])
      user = User.find_by(email: 'new_email@thisemail.com')
      expect(user).not_to be_nil
      expect(response.status).to eq(200)
    end
  end

  context 'without a valid access token' do
    it 'should not be able to hit a protected route' do
      put "/api/user/#{@user[:id]}", { user: {email: 'new_email@thisemail.com'} }, request_access_token_header('bogustoken')
      expect(response.status).to eq(401)
    end
  end

  context 'with an expired token' do
    before do
      user.token.update(expires: Time.now - 1.day)
    end

    it 'should be redirected to the login route' do
      put "/api/user/#{@user[:id]}", { user: {email: 'new_email@thisemail.com'} }, request_access_token_header(@user[:access_token])
      expect(response.headers['LOCATION']).to eq('http://www.example.com/api/login')
      expect(response.status).to eq(302)
    end
  end
end
