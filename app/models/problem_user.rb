class ProblemUser < ApplicationRecord
  belongs_to :problem
  belongs_to :user
end