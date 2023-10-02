class ProtectionsController < ApplicationController

  def index
    @protections = Protection.order("created_at DESC")
  end

  def new
    @protection =Protection.new
  end

  def create
    if @protection.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:protection).permit(:title, :age, :gender_id, :cat_species_id, :character, :image)
  end

end
