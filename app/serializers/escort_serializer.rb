class EscortSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :first_name, :last_name, :city, :description, :price, :stars, :sex, :age, :phone, :avatar, :photos, :visit_counter
  has_one :user
  has_many :categories
  has_many :locations
  has_many :activities

  def avatar
     object.avatar.attached? ? transform_image(object.avatar, 600) : ""
  end

  def photos
    object.photos.attached? ? object.photos.map { |x| transform_image(x, 600) } : [] 
  end

   def transform_image(image, dimension)
    url_for(image.variant(resize_to_limit: [dimension, nil]))
   end
end
