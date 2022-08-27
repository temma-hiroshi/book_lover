class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  has_one_attached :image
  belongs_to :user
end
