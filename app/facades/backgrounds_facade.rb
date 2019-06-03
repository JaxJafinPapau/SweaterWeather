class BackgroundsFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def backgrounds
    flickr.backgrounds['photos']['photo'].map do |photo|
      Background.new(photo)
    end
  end

  private

    def flickr
      @_backgrounds ||= FlickrService.new(@params[:location])
    end
end
