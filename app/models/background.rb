class Background
  attr_reader :id,
              :owner,
              :secret,
              :server,
              :farm,
              :title,
              :ispublic
  def initialize(photo)
    @id = photo['id']
    @owner = photo['owner']
    @secret = photo['secret']
    @server = photo['server']
    @farm = photo['farm']
    @title = photo['title']
    @ispublic = photo['ispublic']
  end

  def url
    "https://farm#{@farm}.staticflickr.com/#{@server}/#{@id}_#{@secret}.jpg"
  end
end
