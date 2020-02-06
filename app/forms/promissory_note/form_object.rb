class PromissoryNote::FormObject
  include ActiveModel::Model

  attr_accessor :file, :code, :loan_id, :guarantee_id

  attr_reader :promissory_note

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      persist!
    end

    true
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.full_messages.each { |error| errors[:base] << error }
    false
  end

  private

  def persist!
    @promissory_note = PromissoryNote.create!(promissory_note_attributes)
  end

  def promissory_note_attributes
    {
      file: file,
      code: code,
      loan_id: loan_id,
      guarantee_id: guarantee_id
    }.reject { |_, v| v.nil? }
  end
end
