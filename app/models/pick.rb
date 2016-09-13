class Pick < ActiveRecord::Base
  belongs_to :tray
  belongs_to :footprint
end
