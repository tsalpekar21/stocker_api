require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe '#login' do
    context 'with a valid user' do
      before do
        get :login, { user: { email: user.email, password: user.password } }, format: :json
      end

      it 'should return a new auth token' do
        result = json_response(response)
        expect(result[:user][:access_token]).not_to eq(user.token.access_token)
        expect(result[:user][:expires]).not_to eq(user.token.expires)
      end

      it { should respond_with 200 }
    end

    context 'with an invalid password' do
      before { get :login, { user: { email: user.email, password: 'THEWRONGPASSWORD' } }, format: :json }

      it 'should return an error message about the invalid password' do
        result = json_response(response)
        expect(result[:errors]).not_to be_nil
      end

      it { should respond_with 422 }
    end

    context 'with an invalid email' do
      before { get :login, { user: { email: 'nonexistantemail@gmail.com', password: 'THEWRONGPASSWORD' } }, format: :json }

      it 'should return an error message about the email not existing' do
        result = json_response(response)
        expect(result[:errors]).not_to be_nil
      end

      it { should respond_with 422 }
    end
  end
end
