require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { should belong_to(:user) }
  
  it { should validate_uniqueness_of(:email) }

  it { should have_secure_password }
end
