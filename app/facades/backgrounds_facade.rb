class BackgroundsFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def backgrounds
    background_collection = flickr.backgrounds['photos']['photo'].map do |photo|
      Background.new(photo)
    end
    background_collection.sample.url
  end

  private

    def flickr
      @_backgrounds ||= FlickrService.new(@params[:location])
    end
end
