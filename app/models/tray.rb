class Tray < ActiveRecord::Base
  belongs_to :user
  has_many :picks, dependent: :destroy
  accepts_nested_attributes_for :picks

  validates_presence_of :name
end
