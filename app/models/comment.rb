class Comment < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true
end
