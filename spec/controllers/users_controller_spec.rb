require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  # let(:user_attributes) { { email: FFaker::Internet.email, first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name } }

  describe 'POST #create' do
    let(:user_attributes) { FactoryGirl.attributes_for :user }

    context 'with the correct number of attributes' do
      before { post :create, { user: user_attributes }, format: :json }
      it 'renders the user in json format' do
        user = json_response(response)[:user]
        expect(user[:first_name]).to eq(user_attributes[:first_name])
        expect(user[:access_token]).not_to be_nil
      end

      it { should respond_with 200 }
    end

    context 'with the incorrect number of attributes' do
      before { post :create, { user: user_attributes.slice(:first_name, :last_name, :password) }, format: :json }
      it 'renders the errors from the user' do
        errors = json_response(response)[:errors]
        expect(errors.first[:email]).to eq(["can't be blank"])
      end

      it { should respond_with 500 }
    end
  end

  describe '#update' do
    let(:new_email) { FFaker::Internet.email }
    let(:new_name) { FFaker::Name.first_name }
    let(:user) { create(:user)}

    before do
      controller_access_token_header(user.token.access_token)
      put :update, { id: user.id, user: { email: new_email, first_name: new_name } }, format: :json
    end

    context 'with some attribtues' do
      it 'should update the user' do
        user = User.find_by(email: new_email)
        expect(user).not_to be_nil
      end

      it { should respond_with 200 }
    end

  end
end
