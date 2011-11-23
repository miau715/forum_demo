class BoardsController < ApplicationController
  def index
    @boards = Boards.all
  end
  
  def show
    @boards = Boards.find(params[:id])
  end
  
  def new
    @boards = Boards.new
  end
  
  def edit
    @boards = Boards.find(params[:id])
  end
  
  def create
    @boards = Boards.new(params[:board])
    @boards.save
  end  
  
  def update
    @boards = Boards.find(params[:id])
    @boards.update_attributes(params[:board])
  end
  
  def destroy
    @boards = Boards.find(params[:id])
    @boards.destroy
  end

end
