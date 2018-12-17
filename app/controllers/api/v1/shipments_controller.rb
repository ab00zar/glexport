module Api
  module V1
    class ShipmentsController < ApplicationController
      def index
        shipments = Shipment.all
        render json: {status: 'Success', data: shipments}, status: :ok
      end
    end
  end
end
