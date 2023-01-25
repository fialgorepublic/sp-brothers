class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[destroy]
  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  def find_user
    @user = User.find_by(id: params[:id])
  end
end
