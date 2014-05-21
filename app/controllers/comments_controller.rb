class CommentsController < ApplicationController
  before_action :set_hotel
  
  # GET /hotels/:id/comments/new
  def new
    @comment = Comment.new
  end

  # POST /hotels/:id/comments
  def create
    comment = comment_params["comment"]
    user_id = current_user.id
    p "comment: #{comment} user_id: #{user_id}"

    @comment = Comment.new(comment: comment, user_id: user_id)
    @hotel.comments << @comment

    respond_to do |format|
      if @comment.valid? and @hotel.comments.last == @comment
         flash[:success] =  'Comment was successfully added'
      else
         flash[:error] =  'Comment was incorrect'
      end
      format.html { redirect_to @hotel }
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
