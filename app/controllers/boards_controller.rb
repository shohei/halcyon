class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
   @boards = Board.all
  end

  def show
    @footprints = Footprint.where(id: @board.places.pluck(:id).uniq)
  end

  def edit
  end

  def update
  end


  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_picks
    board_id = params[:board_id].keys.first
    Pick.generate_from_place(board_id)
    redirect_to '/boards/' + board_id
  end

  def insert_data
    @params = params[:board_data]
    Board.import_from_text(@params)
    redirect_to action: :index
  end

  def load_footprint
    board_id = params[:board_id].keys.first
    file = params[:file]
    Board.load_footprint_csv(file)
    redirect_to '/boards/' + board_id
  end

  private
  def set_board
     @board = Board.find(params[:id])
  end
end
