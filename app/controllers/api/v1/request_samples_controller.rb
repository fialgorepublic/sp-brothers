class Api::V1::RequestSamplesController < Api::BaseController

  def create
    sample_item = RequestSample.new(sample_params)
    sample_item.color_id = params[:color_id]
    if sample_item.save
      json_success_response("Sample Created", sample_item)
    else
      json_error_response('something went wrong', sample_item.errors)
    end
  end

  private

    def sample_params
      params.permit(:full_name, :mobile_no, :email, :business_name, :address, :full_catalog)
    end
end