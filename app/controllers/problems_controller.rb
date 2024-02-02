class ProblemsController < ApplicationController
  def new
    @problem = Problem.new
  end

  def create
    binding.pry
  end
  
end
