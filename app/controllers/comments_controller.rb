class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @problem = Problem.find(params[:problem_id])
    @comments = @problem.comments.includes(:user)
  end

  def create
    @problem = Problem.find(params[:problem_id])
    @comment = @problem.comments.new(comment_params)
    if @comment.save
      redirect_to problem_comments_path(@problem)
    else
      @comments = @problem.messages.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
