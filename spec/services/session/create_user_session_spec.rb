require 'rails_helper'

RSpec.describe Session::CreateUserSession do
  let(:user) { create(:user) }

  let(:session_params) do
    {
      email: user.email,
      password: user.password,
    }
  end

  describe '::call' do
    context 'with valid user input credentials' do
      it 'returns session_created? true' do
        result = Session::CreateUserSession.call(session_params)

        expect(result.session_created?).to eql(true)
      end

      it 'returns user session information' do
        result = Session::CreateUserSession.call(session_params)

        expect(result.session.content).not_to eql(nil)
      end
    end

    context 'with invalid user input credentials' do
      before(:each) { session_params[:password] = Faker::Internet.password }

      it 'returns session_created? false' do
        result = Session::CreateUserSession.call(session_params)

        expect(result.session_created?).to eql(false)
      end

      it 'returns user session errors' do
        result = Session::CreateUserSession.call(session_params)

        expect(result.errors).not_to be_empty
      end
    end
  end
end
