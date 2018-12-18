module Api
  module V1
    class ShipmentsController < ApplicationController

      def index
        return unprocessable if params[:company_id].blank?

        shipments = Shipment.where(company_id: params[:company_id]).sorting(params[:sort], params[:direction])

        shipments = shipments.filters(params[:international_transportation_mode]) if
            !params[:international_transportation_mode].blank?

        shipments = shipments.pagination(params[:page], params[:per])

        render json: {records: JsonMaker::Jsonmkr.new.records(shipments)}
      end
      
      def unprocessable
        render json: {errors: ['company_id is required']}, status: 422
      end

    end
  end
end
