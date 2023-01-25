class Api::V1::RequestSamplesController < Api::BaseController

  def create
    @sample_item = RequestSample.new(sample_params)
    @sample_item.colors << current_user.cart.colors if current_user.cart.present?
    if @sample_item.save
      current_user.cart.destroy if current_user.cart.present?
      json_success_response("Sample Created", @sample_item.as_json(serialize_data))
    else
      json_error_response('something went wrong', sample_item.errors)
    end
  end

  def add_to_cart
    color = Color.find params[:color_id]
    if current_user.cart.present?
      @user_cart =  current_user.cart.colors << color
    else
      current_user.create_cart
      @user_cart = current_user.cart.colors << color 
    end
    json_success_response("Cart Created", @user_cart)
  end

  private

    def sample_params
      params.permit(:full_name, :mobile_no, :email, :business_name, :address, :full_catalog)
    end

    def serialize_data
      { include: :colors  }
    end
end