class Admin::PostsController < ApplicationController
  layout 'admin'

  before_filter :find_board
  before_filter :require_is_admin
  before_filter :authenticate_user! , :except => [ :index ]
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to(board_post_path(@board, @post))
    end
  end
  
  def destroy    
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(board_posts_path(@board))
  end
  
  protected
    def find_board
      @board = Board.find(params[:board_id])
    end
  
end