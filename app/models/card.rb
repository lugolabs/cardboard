class Card < ApplicationRecord
  belongs_to :list
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true

  include RankedModel
  ranks :row_order, with_same: :list_id

  default_scope { rank(:row_order) }
end
