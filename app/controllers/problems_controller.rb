class ProblemsController < ApplicationController
  
  def index
  end
  
  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def problem_params
    params.require(:problem).permit(:problem_title, :message, :standpoint_id, user_ids: [])
  end

end
