module Api
  module V1
    class ShipmentsController < ApplicationController

      def index
        shipments = Shipment.where(company_id: params[:company_id]).order(sorting)

        if !params[:international_transportation_mode].blank?
          shipments = shipments.where(international_transportation_mode: params[:international_transportation_mode])
        end

        shipments = shipments.page(params[:page]).per(params[:per])

        render json: {records: JsonMaker::Jsonmkr.new.records(shipments)}
      end

      def sorting
        field = params[:sort].blank? ? 'id' : params[:sort]
        direction = params[:direction].blank? ? 'ASC' : params[:direction]
        "#{field} #{direction}"
      end

    end
  end
end
