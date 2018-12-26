module Questionable
  extend ActiveSupport::Concern

  module ClassMethods

    def question(params)
      results = self.page(params[:page]) #to make pagination default configs work
      params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end

  end
end
