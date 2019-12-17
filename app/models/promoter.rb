class Promoter < ApplicationRecord
  belongs_to :user
  belongs_to :employee
  has_many :clients, dependent: :nullify
end
