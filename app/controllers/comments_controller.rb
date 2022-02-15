class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
  end

  def create
    @event = Event.find(params[:event_id])
    @comment =  @event.comments.create(comment_params)
    redirect_to events_path
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :event_id)
    end
end
