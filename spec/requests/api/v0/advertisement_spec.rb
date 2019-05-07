# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Adverstiment', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:user) { FactoryBot.create(:user) }
  context 'with valid attributes' do
    it 'returns advertisement token' do
      post '/api/v0/advertisements', params: { user_id: user.id, location: 'Kisumu', category: 'Electronic',
                                               advert_type: 'Phone', model: 'Samsung', price: 10_000 }, headers: headers
      expect(response.status).to eq 201
    end
  end
  describe '/api/v0/advertisements' do
    before do
      FactoryBot.create(:advertisement)
      get '/api/v0/advertisements'
    end
    it 'it returns all adverts' do
      expect(response_json).not_to be_empty
    end
  end
end
