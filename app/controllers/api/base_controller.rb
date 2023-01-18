module Api
    class BaseController < ApplicationController
      include Response
      skip_before_action :verify_authenticity_token
      before_action :authenticate_user
      before_action :set_pagination
      include ActiveStorage::SetCurrent
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error
  
      private
  
      def authenticate_user
        command = AuthorizeApiRequest.new(request.headers).call
        if command.success?
          @current_user = command.result
        else
          json_error_response('Not Authorized', command.errors)
        end
      end
  
      def record_not_found_error
        json_error_response('Record Not Found.', params)
      end
  
      def set_pagination
        @pagination_params = {
         page: params[:page].present? ? params[:page] : 1,
         per_page: params[:per_page].present? ?  params[:per_page] == 'all' ? 100 : params[:per_page] : 10
        }
      end
    end
  end
  