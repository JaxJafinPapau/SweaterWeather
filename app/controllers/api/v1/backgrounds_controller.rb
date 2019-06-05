class Api::V1::BackgroundsController < ApiBaseController

  def index
    facade = BackgroundsFacade.new(params)
    render json: BackgroundsSerializer.new(facade)
  end
end
