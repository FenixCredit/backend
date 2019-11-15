require 'rails_helper'

RSpec.describe Session::DestroyUserSession do
  let(:user) { create(:user) }

  before(:each) { user.tokens.create(token_type: :session) }

  describe '::call' do
    context 'with valid credentials' do
      it 'returns session_destroyed? true' do
        result = Session::DestroyUserSession.call(user.tokens.first.content)

        expect(result.session_destroyed?).to eql(true)
      end
    end
  end
end
