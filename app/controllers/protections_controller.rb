class ProtectionsController < ApplicationController
  before_action :set_protection, only: [:edit, :show, :destroy]

  def index
    @protections = Protection.order("created_at DESC")
  end

  def new
    @protection = Protection.new
  end

  def create
    @protection = Protection.new(protection_params)
    if @protection.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @protection.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    protection = Protection.find(params[:id])
    if protection.update(protection_params)
      redirect_to protection_path(protection)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    protection = Protection.find(params[:id])
    protection.destroy if @protection.user == current_user
    redirect_to root_path
  end


  private

  def set_protection
    @protection = Protection.find(params[:id])
  end

  def protection_params
    params.require(:protection).permit(:title, :age, :gender_id, :cat_species_id, :character, :image).merge(user_id: current_user.id)
  end

end
