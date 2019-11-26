class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  validates :city, presence: true
  validates :category, presence: true
  enum status: [:open, :ignored, :seen]
end
