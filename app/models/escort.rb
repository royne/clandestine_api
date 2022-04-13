class Escort < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories

  validates :user_id, presence: true

  enum sex: [:mujer, :hombre, :indefinido]  
  enum city: [:bogota]  

end
