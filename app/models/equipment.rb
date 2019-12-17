class Equipment < ApplicationRecord
  belongs_to :admin

  validates :code, :name, :cost, presence: true;

  enum type: { office: 1, compute: 2 }
end
