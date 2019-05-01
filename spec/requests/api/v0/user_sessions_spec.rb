# frozen_string_literal: true

RSpec.describe 'Sessions', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/v0/User/auth/sign_in' do
    it 'valid credentials allow user sign in' do
      post '/api/v0/User/auth/sign_in', params: {
        email: user.email, password: user.password
      }, headers: headers

      expected_response = {
        'data' => {
          'id' => user.id, 'email' => user.email,
          'provider' => 'email', 'first_name' => user.first_name,
          'last_name' => user.last_name, 'uid' => user.uid,
          'phone_number' => user.phone_number, 'allow_password_change' => false
        }
      }
      expect(response_json).to eq expected_response
    end
    it 'invalid password returns errors' do
      post '/api/v0/User/auth/sign_in', params: {
        email: user.email, password: 'wrong_password'
      }, headers: headers

      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']
      expect(response.status).to eq 401
    end
    it 'invalid email returns error message' do
      post '/api/v0/User/auth/sign_in', params: {
        email: 'wrong@email.com', password: user.password
      }, headers: headers

      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']
      expect(response.status).to eq 401
    end
  end
end
