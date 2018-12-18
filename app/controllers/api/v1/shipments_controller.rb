module Api
  module V1
    class ShipmentsController < ApplicationController

      def index
        shipments = Shipment.where(company_id: params[:company_id]).order(ordering)
        render json: {records: JsonMaker::Jsonmkr.new.records(shipments)}
      end

      def ordering
        field = params[:sort].blank? ? 'id' : params[:sort]
        direction = params[:direction].blank? ? 'ASC' : params[:direction]
        "#{field} #{direction}"
      end

    end
  end
end
