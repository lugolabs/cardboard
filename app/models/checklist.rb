class Checklist < ApplicationRecord
  belongs_to :card
  belongs_to :user
  has_many :checklist_items, dependent: :destroy

  validates :title, presence: true

  def progress_display
    "#{checked_item_count}/#{item_count}"
  end

  def progress
    return 0 if item_count.zero?
    (checked_item_count / item_count.to_f) * 100
  end

  private

  def item_count
    @item_count ||= checklist_items.size
  end

  def checked_item_count
    @checked_item_count ||= checklist_items.checked.size
  end
end
