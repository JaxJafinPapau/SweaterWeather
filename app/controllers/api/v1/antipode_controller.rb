class Api::V1::AntipodeController < ApplicationController
  def index
    facade = AntipodeFacade.new(params)
    render json: AntipodeSerializer.new(facade)
  end
end
