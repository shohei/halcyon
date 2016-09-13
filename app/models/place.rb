class Place < ActiveRecord::Base
  belongs_to :board
  belongs_to :footprint
end
