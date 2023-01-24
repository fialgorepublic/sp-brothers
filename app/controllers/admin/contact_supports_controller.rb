class Admin::ContactSupportsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_contact_support, only: %i[destroy]

  def index
    @contact_support = ContactSupport.all
  end

  def destroy
    @contact_support.destroy
    respond_to do |format|
      format.html { redirect_to admin_contact_supports_path, notice: "Contact Support was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def find_contact_support
    @contact_support = ContactSupport.find(params[:id])
  end
end
