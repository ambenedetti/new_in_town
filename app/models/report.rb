class Report < ApplicationRecord
  belongs_to :tip
  belongs_to :user
  belongs_to :reason
  validates :description, presence: true
  validates :reason, presence: true
end
