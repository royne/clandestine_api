class EscortSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :city, :description, :price, :stars, :sex, :age, :phone
  has_one :user
end
