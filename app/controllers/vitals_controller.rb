class VitalsController < ApplicationController
  before_action :set_user
  
  def index
    @vitals = @user.vitals.page(params[:page]).per(7).order("record_date DESC")
  end

  def new
    @vital = Vital.new
  end

  def create
    @vital = Vital.new(record_date: Date.new(vital_params["record_date(1i)"]&.to_i, vital_params["record_date(2i)"]&.to_i, vital_params["record_date(3i)"]&.to_i),
                       weight: vital_params[:weight],
                       blood_pressure: vital_params[:blood_pressure],
                       pulse: vital_params[:pulse],
                       memo: vital_params[:memo],
                       user_id: current_user.id
                      )
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
