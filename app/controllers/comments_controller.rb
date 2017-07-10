class CommentsController < ApplicationController
  before_action :set_event
  skip_after_action :verify_authorized

  def create
    @comment = @event.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment added to the event"
      redirect_to event_path(@comment.event)
    else
      flash.now[:alert] = "Comment not added added to the event"
      render "events/show"
    end
  end

  private
  def set_event
    @event = Event.friendly.find(params[:event_id])
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
