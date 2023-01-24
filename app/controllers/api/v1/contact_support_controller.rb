class Api::V1::ContactSupportController < Api::BaseController
  skip_before_action :authenticate_user

  def create_contact_support
    @contact_support = ContactSupport.new(support_params)
    if @contact_support.save
      json_success_response("Contact support received your message", @contact_support)
    else
      json_error_response('something went wrong', @contact_support.errors)
    end
  end

  private

  def support_params
    params.permit(:name, :contact, :email, :message)
  end

end