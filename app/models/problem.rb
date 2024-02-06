class Problem < ApplicationRecord
  has_many :problem_users
  has_many :users, through: :problem_users

  validates :problem_title, presence: true
  validates :message, presence: true
  validates :standpoint_id, presence: true
  
end