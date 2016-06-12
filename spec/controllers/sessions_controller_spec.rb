require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe '#login' do
    context 'with a valid user' do
      before { post :login, { user: { email: user.email, password: user.password } }, format: :json }

      it 'should return an authentication token' do
        result = json_response(response)
        expect(result[:user][:access_token]).not_to be_nil
      end

      it { should respond_with 200 }
    end

    context 'with an invalid user' do
      before { post :login, { user: { email: user.email, password: 'THEWRONGPASSWORD' } }, format: :json }

      it 'should return an error message about the invalid password' do
        result = json_response(response)
        expect(result[:errors]).not_to be_nil
      end

      it { should respond_with 422 }
    end
  end
end
