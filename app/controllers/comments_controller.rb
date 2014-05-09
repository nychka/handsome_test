class CommentsController < ApplicationController
  before_action :set_hotel
  
  # GET /hotels/:id/comments/new
  def new
    @comment = Comment.new
  end

  # POST /hotels/:id/comments
  def create
    @comment = Comment.new(comment_params)
    @hotel.comments << @comment

    respond_to do |format|
      if @hotel.comments.last == @comment
        format.html { redirect_to @hotel, notice: 'Comment was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  private
  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
