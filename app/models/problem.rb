class Problem < ApplicationRecord
  has_many :problem_users, dependent: :destroy
  has_many :users, through: :problem_users
  has_many :comments, dependent: :destroy

  validates :problem_title, presence: true
  validates :message, presence: true
  validates :standpoint_id, numericality: { other_than: 1, message: 'must be selected' }
  
end