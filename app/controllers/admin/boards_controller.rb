class Admin::BoardsController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin

  def index
    @boards = Board.all
  end
  
  def show
    @board = Board.find(params[:id])
    @posts = @board.posts.all
  end
  
  def new
    @board = Board.new
  end
  
  def edit
    @board = Board.find(params[:id])
  end
  
  def create
    @board = Board.new(params[:board])
    @board.save
    redirect_to(board_path(@board))
  end  
  
  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params[:board])
    redirect_to(board_path(@board))
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to(boards_path)
  end

end
