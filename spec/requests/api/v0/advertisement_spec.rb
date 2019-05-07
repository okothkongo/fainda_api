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
  describe ' GET/api/v0/advertisements' do
    before do
      FactoryBot.create(:advertisement)
      get '/api/v0/advertisements'
    end
    it 'it returns all adverts' do
      expect(response_json).not_to be_empty
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /api/v0/advertisement/:id' do
    before do
      @advertisement_id = FactoryBot.create(:advertisement).id
      get "/api/v0/advertisements/#{@advertisement_id}"
    end
    context 'when advert exists' do
      it 'it returns single advert' do
        expect(response_json).not_to be_empty
        expect(response_json['id']).to eq(@advertisement_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'POST /api/v0/advertisement/:id' do
    context 'when the advert exists' do
      before do
        @advertisement_id = FactoryBot.create(:advertisement).id
        put "/api/v0/advertisements/#{@advertisement_id}", params: { location: 'Migori' }
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
  describe 'DELETE /api/v0/advertisement/:id' do
    before do
      @advertisement_id = FactoryBot.create(:advertisement).id
      delete "/api/v0/advertisements/#{@advertisement_id}"
    end
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
