class Tip < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :question
  has_many :votes
  has_many :reports
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  validates :city, presence: true
  validates :category, presence: true
  enum status: [ :accepted, :flagged, :reviewed, :hidden]

end
