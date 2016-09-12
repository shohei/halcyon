class Board < ActiveRecord::Base
	belongs_to :user
	has_many :components, dependent: :destroy
	accepts_nested_attributes_for :components

	validates_presence_of :name

	def self.import_from_text(params)
		@name = params[:name]
		@text = params[:components]

		counter = 0
		line = @text.split(/[\r\n]+/)
		@components_array = []
		for l in line 
			if(counter!=0&&counter!=1)	
				elements = l.split(" ")
				chash = {}
				if(Board.all.empty?)
					nextid = 1
				else
					nextid = Board.maximum(:id).next
				end
				chash[:board_id]=nextid
				chash[:designator]=elements[0]
				chash[:footprint]=elements[1]
				chash[:mid_x]=Board.prettify(elements[2])
				chash[:mid_y]=Board.prettify(elements[3])
				chash[:ref_x]=Board.prettify(elements[4])
				chash[:ref_y]=Board.prettify(elements[5])
				chash[:pad_x]=Board.prettify(elements[6])
				chash[:pad_y]=Board.prettify(elements[7])
				chash[:tb]=elements[8]
				chash[:rotation]=elements[9]
				chash[:comment]=elements[10]
				chash[:unit]="mm"
				@components_array.push(chash)
			end
			counter+=1
		end
		params = {board: {name: @name, components_attributes: @components_array }}
		board = Board.create(params[:board])
		board.save
	end

	def self.prettify(text)
		num = text.gsub("mm","")
		return num
	end

end