class FoodsController < ApplicationController
  before_action :set_user

  def index
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      respond_to do |format|
        format.html { redirect_to foods_path, alert: '登録成功しました' }
        format.json
      end
    else
      render :index, alert: '登録に失敗しました'
    end
  end

  def search
    @foods = Food.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calorie)
  end

  def set_user
    @user = current_user
  end

end
