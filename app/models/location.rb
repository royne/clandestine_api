class Location < ApplicationRecord
  has_and_belongs_to_many :escorts
end