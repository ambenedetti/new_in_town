class UserCity < ApplicationRecord
  validates :city, presence: true
  validates_uniqueness_of :city, :scope => [:user_id]

  belongs_to :user
end
