class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :age, presence: true

  validates :gender_id, :occupation_id, :family_id,
            numericality: { other_than: 1, message: 'must be selected' }
  
end