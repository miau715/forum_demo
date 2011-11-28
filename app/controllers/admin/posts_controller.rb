class Admin::PostsController < ApplicationController
  layout 'admin'

  before_filter :find_board
  before_filter :require_is_admin

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