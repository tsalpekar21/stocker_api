require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user_attributes) { FactoryGirl.attributes_for :user }
  before do
    post '/api/users', { user: user_attributes }, format: :json
    @user = json_response(response)
  end

  context 'with a created user' do
    xit 'should receive a valid authentication token'
    xit { should respond_with 200 }
  end
end
