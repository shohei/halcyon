class Tray < ActiveRecord::Base
  belongs_to :board

  validates_presence_of :name
end
