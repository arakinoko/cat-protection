class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @protections = current_user.protections
  end
end
