# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  describe 'advertisments table' do
    it { is_expected.to have_db_column :location }
    it { is_expected.to have_db_column :category }
    it { is_expected.to have_db_column :type }
    it { is_expected.to have_db_column :model }
    it { is_expected.to have_db_column :price }
  end
  describe 'validate advertisement attributes' do
    it { is_expected.to validate_presence_of(:location) }
    it { should validate_length_of(:location).is_at_most(20) }
    it { is_expected.to validate_presence_of(:category) }
    it { should validate_length_of(:category).is_at_most(20) }
    it { is_expected.to validate_presence_of(:type) }
    it { should validate_length_of(:type).is_at_most(20) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end
end
