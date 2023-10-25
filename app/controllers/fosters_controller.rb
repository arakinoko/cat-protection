class FostersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_protection, only: [:index, :create]

  def index
    @foster_address = FosterAddress.new
  end

  def create
    @foster_address =FosterAddress.new(foster_params)
    if @foster_address.valid?
      @foster_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def foster_params
    params.require(:foster_address).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, protection_id: params[:protection_id])
  end

  def non_purchased_protection
    @protection = Protection.find(params[:protection_id])
  end

end
