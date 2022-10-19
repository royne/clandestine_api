class Escort < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories
  has_one_attached :avatar
  has_many_attached :photos

  validates :user_id, presence: true
  validates :phone, presence: true, uniqueness: { case_sensitive: false }

  enum subscription_type: [:basic, :silver, :gold, :premium]  
  enum sex: [:mujer, :hombre, :indefinido]  
  enum city: [:bogota]  

  def increase_visit_counter!
    self.update(visit_counter: visit_counter + 1)
  end

end
