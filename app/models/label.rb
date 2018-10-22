class Label < ApplicationRecord
  COLORS = ['#1abc9c', '#2ecc71', '#3498db', '#9b59b6', '#16a085', '#27ae60', '#2980b9', '#8e44ad'].freeze

  has_many :card_labels, dependent: :destroy
end
