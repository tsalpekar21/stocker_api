require 'rails_helper'

RSpec.describe Token, type: :model do
  subject { build(:token) }

  describe 'validations' do
    it { should validate_uniqueness_of(:access_token) }
  end

  describe '#expired?' do
    it 'returns true when a token is expired' do
      expect(subject.expired?).to eq(false)
    end
  end


end
