class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @problem = Problem.find(params[:problem_id])
  end
end
