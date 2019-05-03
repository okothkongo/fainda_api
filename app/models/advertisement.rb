# frozen_string_literal: true

class Advertisement < ApplicationRecord
  belongs_to :user
  validates :location, presence: true, length: { maximum: 20 }
  validates :category, presence: true, length: { maximum: 20 }
  validates :type, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { only_integer: true }
end
