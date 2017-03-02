class TrackedTerm < ApplicationRecord
  belongs_to :user, inverse_of: :tracked_terms

  validates :term, presence: true
  validate :user_quota, on: :create

  private
  def user_quota
    if user.tracked_terms.count >= 3
     errors.add(:max_terms, "Sorry, you cannot exceed the maximum of 3 terms.")
   end
  end
end
