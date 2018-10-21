class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :user

  validates :title, presence: true
end
