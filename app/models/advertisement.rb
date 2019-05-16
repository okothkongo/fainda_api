# frozen_string_literal: true

class Advertisement < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  validates :location, presence: true, length: { maximum: 20 }
  validates :category, presence: true, length: { maximum: 20 }
  validates :advert_type, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { only_integer: true }
end
