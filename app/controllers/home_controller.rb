class HomeController < ApplicationController
  def index
  end

  def insert_data
  	@params = params[:board_data]
  	Board.import_from_text(@params)
  	redirect_to action: :index
  end
end
