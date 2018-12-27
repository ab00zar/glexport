module Api
  module V1
    class ShipmentsController < ApplicationController

      #index method generates proper results
      def index
        return unprocessable if params[:company_id].blank?

        @shipments = Shipment.question(questioning_params(params)).sorting(params[:sort], params[:direction])

        #JsonMaker service is used to generate Json
        #render json: {records: JsonMaker::Jsonmkr.new.records(shipments)}
      end

      private
      #This method handles invalid params
      def unprocessable
        render json: {errors: ['company_id is required']}, status: 422
      end

      def questioning_params(params)
        params.slice(:company_id, :international_transportation_mode, :page, :per)
      end

    end
  end
end
