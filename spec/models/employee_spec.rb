require 'rails_helper'

RSpec.describe Employee, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:admin) }

  it { should belong_to(:role) }

  it { should have_many(:promoters) }

  it { should validate_uniqueness_of(:email) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:salary) }

  it { should define_enum_for(:status).with_values(enabled: 1, disabled: 2) }

  it { should have_secure_password }
end
