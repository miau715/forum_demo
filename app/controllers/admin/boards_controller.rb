class Admin::BoardsController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  
  def new
    @board = Board.new
  end
  
  def edit
    @board = Board.find(params[:id])
  end
  
  def create
    @board = Board.new(params[:board])
    if @board.save
      redirect_to(board_path(@board), :notice => 'Board was successfully created.')
    end
  end  
  
  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(params[:board])
      redirect_to(board_path(@board), :notice => 'Board was successfully updated.')
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to(boards_path)
  end
end
