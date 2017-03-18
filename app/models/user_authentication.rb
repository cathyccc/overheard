class UserAuthentication < ApplicationRecord
  belongs_to :user, inverse_of: :user_authentications
end
