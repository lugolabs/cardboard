class Message < ApplicationRecord
  belongs_to :card
  belongs_to :user

  validates :content, presence: true

  default_scope { order(created_at: :desc) }
end
