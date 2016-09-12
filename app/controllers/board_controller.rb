class BoardController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
   @boards = Board.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def insert_data
    @params = params[:board_data]
    Board.import_from_text(@params)
    redirect_to action: :index
  end

  def set_board
     @board = Board.find(params[:id])
  end
end
