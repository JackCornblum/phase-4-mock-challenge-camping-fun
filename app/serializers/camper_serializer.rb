class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  has_many :activities
  # has_many :activities, through: :signups
end
