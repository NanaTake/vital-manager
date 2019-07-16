class FoodsController < ApplicationController
  before_action :set_user

  def index
    # @food = Food.new
  end

  def create
  end

  def show
  end

  private

  # def food_params
  #   params.require(:food).permit(:name, :calorie)
  # end

  def set_user
    @user = current_user
  end

end
