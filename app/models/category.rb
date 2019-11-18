class Category < ApplicationRecord
  has_many :tips
  has_many :questions
end
