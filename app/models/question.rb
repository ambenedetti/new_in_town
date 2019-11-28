class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  validates :city, presence: true
  validates :category, presence: true
  has_many :tips
  has_many :ignored_questions
  enum status: [:open, :ignored, :seen, :answered]
  attr_accessor :location
end
