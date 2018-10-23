class Card < ApplicationRecord
  COLORS = ['#1abc9c', '#2ecc71', '#3498db', '#9b59b6', '#16a085', '#27ae60', '#2980b9', '#8e44ad'].freeze

  belongs_to :list
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :checklists, dependent: :destroy

  validates :title, presence: true

  include RankedModel
  ranks :row_order, with_same: :list_id

  default_scope { rank(:row_order) }

  def colorize
    color.presence || 'inherit'
  end

  def colorize_mini
    color.presence || 'transparent'
  end
end
