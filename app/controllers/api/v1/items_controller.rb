class Api::V1::ItemsController < Api::BaseController

	def index
		if params[:category]
			@items = Item.item_type(params[:category])
		else
			@items = Item.special_item(params[:special_item])
		end
		json_success_response("All Items", @items)
  end
end