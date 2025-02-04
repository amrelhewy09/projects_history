class CommentsController < ApplicationController
  before_action :authenticate_user!


  def new
  end
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to project_path(@comment.project_id)
    else
      redirect_to project_path(@comment.project_id), notice: "Comment can't be blank"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :project_id)
  end
end
