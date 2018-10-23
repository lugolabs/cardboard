class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :user

  validates :title, presence: true

  scope :checked, -> { where.not(checked_at: nil) }

  def checked
    checked_at.present?
  end

  def checked=(value)
    self.checked_at = value == '1' ? Time.current : nil
  end
end
