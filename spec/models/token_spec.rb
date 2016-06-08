require 'rails_helper'

RSpec.describe Token, type: :model do
  describe 'validations' do
    subject { build(:token) }
    it { should validate_presence_of(:access_token) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:expires) }
    it { should validate_uniqueness_of(:access_token) }
  end


  describe '#expired?' do
    let(:expired_token) { create(:token, expires: Time.now - 1.day) }
    let(:valid_token) { create(:token, expires: Time.now + 1.day) }

    it 'returns true when a token is expired' do
      expect(expired_token.expired?).to eq(true)
    end

    it 'returns false when a token is not expired' do
      expect(valid_token.expired?).to eq(false)
    end
  end


end
