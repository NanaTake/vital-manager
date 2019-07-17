class VitalsController < ApplicationController
  before_action :set_user
  
  def index
    @vitals = @user.vitals.page(params[:page]).per(7).order("record_date DESC")
  end

  def new
    @vital = Vital.new
  end

  def create
    @vital = Vital.new(vital_params)
    if @vital.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def vital_params
    params.require(:vital).permit(:record_date, :weight, :blood_pressure, :pulse, :memo).merge(user_id: current_user.id)
  end

  def set_user
    @user = current_user
  end

end
