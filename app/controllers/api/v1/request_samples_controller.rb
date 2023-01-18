class Api::V1::RequestSamplesController < Api::BaseController
	before_action :find_item, only: [:create]

	def create
		sample_item = @item.request_samples.new(sample_params)
		if sample_item.save
			json_success_response("Sample Created", sample_item)
		else
			json_error_response('something went wrong', sample_item.errors)
		end
  end

  private

		def sample_params
			params.permit(:full_name, :mobile_no, :email, :business_name, :address)
		end

    def find_item
      @item = Item.find(params[:item_id])
    end
end