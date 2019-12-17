require 'rails_helper'

RSpec.describe Equipment, type: :model do
  it { should belong_to(:admin) }

  it { should validate_presence_of(:code) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:cost) }

  it { should define_enum_for(:type).with_values(office: 1, compute: 2) }
end
