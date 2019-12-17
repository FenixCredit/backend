require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :request do
  describe 'POST #create' do
    let(:admin) { create(:admin) }

    let(:params) do
     {
       session: {
         email: admin.email,
         password: admin.password
       }
     }
    end

   context 'with valid user input credentials' do
     it 'responds with http ok' do
       post('/sessions', params: params, headers: base_headers)

       expect(response).to have_http_status(:success)
     end

     it 'creates a session for user' do
       post('/sessions', params: params, headers: base_headers)

       expect(Token.count).to eql(1)
     end

     it 'returns json with session root key' do
       post('/sessions', params: params, headers: base_headers)

       expect(response.body).to have_json_path('session')
     end
   end

   context 'with invalid user input credentials' do
     before(:each) { params[:session][:password] = Faker::Internet.password }

     it 'responds with http bad_request' do
       post('/sessions', params: params, headers: base_headers)

       expect(response).to have_http_status(:bad_request)
     end

     it 'does not create session for user' do
       post('/sessions', params: params, headers: base_headers)

       expect(Token.count).to eql(0)
     end

     it 'returns json with errors root key' do
       post('/sessions', params: params, headers: base_headers)

       expect(response.body).to have_json_path('errors')
     end
   end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }

    before(:each) { user.tokens.create(token_type: :session) }

    context 'with valid credentials' do
      let(:headers) { base_headers.merge(authorized_headers(user)) }

      it 'responds with http success' do
        delete('/sessions', headers: headers)

        expect(response).to have_http_status(:success)
      end

      it 'deletes user session token' do
        delete('/sessions', headers: headers)

        expect(user.tokens.count).to eql(0)
      end
    end
  end
end
