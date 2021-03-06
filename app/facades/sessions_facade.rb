class SessionsFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def api_key
    user.api_key
  end

  def user
    user = User.find_by(email: @params[:email])
    user if user.authenticate(@params[:password])
  end
end
