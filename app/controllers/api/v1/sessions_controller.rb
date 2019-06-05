class Api::V1::SessionsController < ApiBaseController
  def create
    facade = SessionsFacade.new(user_params)
    if facade.user
      session[:user_id] = facade.user.id
      render status: 200, json: SessionsSerializer.new(facade)
    else
      render status: 404
    end
  end

  private

    def user_params
      params.permit(:email, :password)
    end
end
