class UsersController < ApplicationController
  before_action :authenticate_user!
  def dashboard

  end

  def update
    @user = current_user
    if @user.update_attributes(current_user_params)
      flash[:notice] = "Saved"
    else
      flash[:alert] = "Cannot save"
    end
  end

  private
  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language)
  end
end
