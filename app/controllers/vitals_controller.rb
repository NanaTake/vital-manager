class VitalsController < ApplicationController
  before_action :set_user
  
  def index
  end

  def new
    @vital = Vital.new
  end

  def create
    @vital = Vital.new(vital_params)
    binding.pry
    if @vital.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def vital_params
    params.require(:vital).permit(Form::Vital::REGISTRABLE_ATTRIBUTES).merge(user_id: current_user.id)
  end

  def set_user
    @user = current_user
  end

end
