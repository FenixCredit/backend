require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:email) }

  it { should validate_presence_of(:first_name) }

  it { should validate_presence_of(:last_name) }

  it { should validate_presence_of(:email) }

  it { should define_enum_for(:gender).with_values(male: 0, female: 1, other: 2) }

  it { should have_secure_password }
end
