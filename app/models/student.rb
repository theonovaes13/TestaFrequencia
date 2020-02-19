class Student < ApplicationRecord
  has_and_belongs_to_many :subjects, join_table: :subscriptions
end
