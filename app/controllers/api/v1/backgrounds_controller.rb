class Api::V1::BackgroundsController < ApplicationController
  
  def index
    facade = BackgroundsFacade.new(params)
    render json: BackgroundsSerializer.new(facade)
  end
end
