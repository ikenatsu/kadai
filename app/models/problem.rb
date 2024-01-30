class Problem < ApplicationRecord
  has_many :problem_users
  has_many :users, through: :problem_users
end