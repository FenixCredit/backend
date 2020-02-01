class PromissoryNote < ApplicationRecord
  belongs_to :loan
  belongs_to :guarantee

  validates :file, :code, presence: true

  mount_uploader :file, PromissoryNoteFileUploader
end
