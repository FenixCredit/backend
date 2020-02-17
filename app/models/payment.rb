class Payment < ApplicationRecord
  belongs_to :client
  belongs_to :loan
  belongs_to :promoter

  enum status: { not_executed: 1, executed_complete: 2, executed_partial: 3 }
  validates :quantity, presence: true

  scope :get_executed, -> (loan) do
    where(status: ['executed_complete', 'executed_partial']).where(client: loan.client, promoter: loan.client.promoter)
  end
end
