class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.valid?
    @goal.update_attributes(goal_params)
    redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
     @goal = Goal.find(params[:id])
     @goal.destroy
     redirect_to goals_path
  end



  private

  def goal_params
    params.require(:goal).permit(:title, :description, :category, :targetdate, :finishline)
  end



end
