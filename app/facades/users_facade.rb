class UsersFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def api_key
    key = SecureRandom.urlsafe_base64.to_s
    create_user(key)
    key
  end

  private

    def create_user(key)
      User.create(email: @params['email'],
                  api_key: key,
                  password: @params['password'])
    end
end
