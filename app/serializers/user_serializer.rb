class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role

  def role
    object.roles[0].name
  end
end
