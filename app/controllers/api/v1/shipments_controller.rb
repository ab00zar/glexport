module Api
  module V1
    class ShipmentsController < ApplicationController

      def index
        shipments = Shipment.where(company_id: params[:company_id])
      end

    end
  end
end
