class Background
  attr_reader :owner,
              :secret,
              :server,
              :farm,
              :title,
              :ispublic
  def initialize(photo)
    @owner = photo['owner']
    @secret = photo['secret']
    @server = photo['server']
    @farm = photo['farm']
    @title = photo['title']
    @ispublic = photo['ispublic']
  end
end
