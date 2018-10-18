class User < ApplicationRecord
  include Clearance::User

  has_many :boards, dependent: :destroy

  enum role: { normal: 1, admin: 2 }

  # validates :first_name, presence: true

  def all_boards
    boards
  end

  def all_lists
    List.where(board_id: boards.select(:id))
  end

  def cards
    Card.where(list_id: all_lists.select(:id))
  end

  def name
    first_name || last_name || email.split('@')[0]
  end
end
