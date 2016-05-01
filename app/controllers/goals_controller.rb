class GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.create(goal_params)
    if @goal.valid?
      redirect_to goal_path(@goal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :category, :targetdate, :finishline)
  end



end
