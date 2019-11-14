require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe '#POST create' do
    let(:password) { Faker::Internet.password }

    let(:params) do
      {
        user: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          phone: Faker::PhoneNumber.phone_number,
          gender: 0,
          profile_picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'user.png')),
          birthday: Faker::Date.birthday(18, 65),
          preferences: {},
          password: password,
          password_confirmation: password
        }
      }
    end

    context 'with valid information' do
      it 'responds with http created' do
        post('/users', params: params, headers: base_headers)

        expect(response).to have_http_status(:created)
      end

      it 'creates an user' do
        post('/users', params: params, headers: base_headers)

        expect(User.count).to eql(1)
      end
    end

    context 'with invalid information' do
      before(:each) { params[:user][:email] = "" }

      it 'responds with http bad request' do
        post('/users', params: params, headers: base_headers)

        expect(response).to have_http_status(:bad_request)
      end

      it 'responds with errors' do
        post('/users', params: params, headers: base_headers)

        expect(response.body).to have_json_path('errors')
      end
    end
  end
end
