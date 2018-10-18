class List < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_many :cards, dependent: :destroy

  validates :title, presence: true

  before_create :set_position

  default_scope { order(:position) }

  private

  def set_position
    self.position = (board.lists.order(position: :desc).first.try(:position) || 0) + 1
  end
end
