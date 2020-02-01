class GuaranteeProduct < ApplicationRecord
  belongs_to :promissory_note
  belongs_to :product
end
