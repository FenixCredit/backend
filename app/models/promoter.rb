class Promoter < ApplicationRecord
  belongs_to :user
  belongs_to :employee
  has_many :clients, dependent: :nullify

  mount_uploader :contract, PromoterContractUploader
end
