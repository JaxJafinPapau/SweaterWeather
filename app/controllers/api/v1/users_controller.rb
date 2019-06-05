class Api::V1::UsersController < ApiBaseController
  def create
    facade = UsersFacade.new(user_params)
    render status: 201, json: UsersSerializer.new(facade)
  end

  private

    def user_params
      params.permit(:email, :password)
    end
end
