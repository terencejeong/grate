class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :profile, optional: true 
end
