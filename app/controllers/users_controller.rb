class UsersController < ApplicationController

  def index
  end
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
      reset_session
    else
      render :edit
    end
  end

  def show
    @user = current_user
    @vitals = @user.vitals.page(params[:page]).per(30).order("record_date DESC")
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end