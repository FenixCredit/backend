require 'rails_helper'

RSpec.describe Api::V1::SessionSerializer do
  context 'user session' do
    let(:user) { create(:user) }

    let(:token) { user.tokens.first }

    let(:json) do
      Api::V1::SessionSerializer.new(token).to_json
    end

    before(:each) { user.tokens.create(token_type: :session) }

    it 'returns token as root key' do
      expect(json).to have_json_path('token')
    end
  end
end
