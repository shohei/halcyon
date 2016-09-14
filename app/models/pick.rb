class Pick < ActiveRecord::Base
  belongs_to :board
  belongs_to :footprint

  def self.generate_from_place(board_id)
    footprint_comment_group = Place.select(:footprint_id,:comment).group(:footprint_id,:comment).count(:footprint_id,:comment)
    footprint_comment_group.keys.each do |f|
      if(Pick.where(board_id: board_id, footprint_id: f[0],comment: f[1]).empty?)
        pick = Pick.new
        pick.board_id = board_id
        pick.footprint_id = f[0]
        pick.comment  = f[1]
        pick.amount = footprint_comment_group[f]
        pick.unit = "mm"
        pick.save
      end
    end
  end

end
