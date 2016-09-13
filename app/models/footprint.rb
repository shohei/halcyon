class Footprint < ActiveRecord::Base
  has_many :picks
  has_many :places
end
