class Subscription < ApplicationRecord
  belongs_to :subject
  belongs_to :student
end
