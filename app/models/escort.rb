class Escort < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories

  validates :user_id, presence: true
  validates :phone, presence: true, uniqueness: { case_sensitive: false }

  enum subscription_type: [:basic, :silver, :gold, :premium]  
  enum sex: [:mujer, :hombre, :indefinido]  
  enum city: [:bogota]  

end
