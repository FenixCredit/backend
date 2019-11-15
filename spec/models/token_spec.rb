require 'rails_helper'

RSpec.describe Token, type: :model do
  it do
    should define_enum_for(:token_type).with_values(
      session: 0
    )
  end

  it { should belong_to(:user) }
end
