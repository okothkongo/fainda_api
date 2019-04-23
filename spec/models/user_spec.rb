require 'rails_helper'

RSpec.describe User, type: :model do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:user)).to be_valid
    end
end