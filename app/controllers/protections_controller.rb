class ProtectionsController < ApplicationController

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
    @protection = Protection.find(params[:id])
    if @protection.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    protection = Protection.find(params[:id])
    if protection.update(protection_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @protection = Protection.find(params[:id])
  end



  private
  def protection_params
    params.require(:protection).permit(:title, :age, :gender_id, :cat_species_id, :character, :image).merge(user_id: current_user.id)
  end

end
