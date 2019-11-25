class Vote < ApplicationRecord
  belongs_to :tip
  belongs_to :user, optional: true

  validate :user_or_guest_must_be_present

  enum direction: [:up, :down]

  after_save :update_counter_cache
  after_destroy :update_counter_cache

  def user_or_guest_must_be_present
    return true if user_id || guest

    errors.add(:base, 'No user or guest user set!')
  end

  private

  def update_counter_cache
    tip.upvote_count = tip.votes.up.count
    tip.save
  end
end
