class Vote < ApplicationRecord
  belongs_to :tip
  belongs_to :user, optional: true

  validate :user_or_guest_must_be_present

  enum direction: [:up, :down]

  def user_or_guest_must_be_present
    return true if user_id || guest

    errors.add(:base, 'No user or guest user set!')
  end
end
