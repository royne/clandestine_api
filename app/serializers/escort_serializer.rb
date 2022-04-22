class EscortSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :first_name, :last_name, :city, :description, :price, :stars, :sex, :age, :phone, :avatar, :photos
  has_one :user

  def avatar
     object.avatar.attached? ? url_for(object.avatar) : ""
  end

  def photos
    object.photos.attached? ? object.photos.map { |x| url_for(x) } : [] 
  end
end
