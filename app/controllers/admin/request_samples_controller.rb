class Admin::RequestSamplesController < ApplicationController
  before_action :find_sample, only: [:show, :destroy]

  def index
    @samples = RequestSample.all
  end

  def show; end

  def destroy
    @sample.destroy
    respond_to do |format|
      format.html { redirect_to admin_request_samples_path, notice: "Request Sample was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def find_sample
      @sample = RequestSample.find(params[:id])
    end
end
