class Tip < ApplicationRecord
  include AlgoliaSearch
  belongs_to :category
  belongs_to :user
  belongs_to :question, optional: true
  has_many :votes
  has_many :reports
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  validates :city, presence: true
  enum status: [ :accepted, :flagged, :reviewed, :hidden]

  algoliasearch do
    attributes :title, :content, :city, :category, :user
  end
end
