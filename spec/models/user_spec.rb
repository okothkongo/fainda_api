# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end
  describe 'User Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :provider }
    it { is_expected.to have_db_column :uid }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :reset_password_token }
    it { is_expected.to have_db_column :reset_password_sent_at }
    it { is_expected.to have_db_column :remember_created_at }
    it { is_expected.to have_db_column :sign_in_count }
    it { is_expected.to have_db_column :current_sign_in_at }
    it { is_expected.to have_db_column :last_sign_in_at }
    it { is_expected.to have_db_column :current_sign_in_ip }
    it { is_expected.to have_db_column :last_sign_in_ip }
    it { is_expected.to have_db_column :confirmation_token }
    it { is_expected.to have_db_column :confirmed_at }
    it { is_expected.to have_db_column :confirmation_sent_at }
    it { is_expected.to have_db_column :unconfirmed_email }
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :phone_number }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
  describe 'user attribute validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_confirmation_of(:password) }

    context 'should not be invalid email address' do
      emails = ['ppp@ qr.com', '@example.com', 'trial test @gmail.com',
                'linda@podii', 'yyy@.x. .x', 'zzz@.z']
      emails.each do |email|
        it { is_expected.not_to allow_value(email).for(:email) }
      end
    end
    context 'should have a valid email address' do
      emails = ['flower@fl.com', 'helloworld@example.ke', 'trialbait@goosepump.de',
                'okothkongo@gmail.com', 'janedoe@originals.ze']
      emails.each do |email|
        it { is_expected.to allow_value(email).for(:email) }
      end
    end
  end
  describe 'advert association' do
    it { is_expected.to have_many(:advertisements).dependent(:destroy) }
  end
end
