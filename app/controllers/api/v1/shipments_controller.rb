module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        @shipments = Shipment.all
        render json: {data: @shipments}, status: :ok
      end
    end
  end
end
