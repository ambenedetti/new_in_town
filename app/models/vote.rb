class Vote < ApplicationRecord
  belongs_to :tip
  belongs_to :user
  enum direction: [:up, :down]
end
