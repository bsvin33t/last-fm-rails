class ArtistDecorator
  def initialize(artist)
    @artist = artist
  end

  def image
    @artist["image"][2]["#text"]
  end

  def name
    @artist["name"]
  end
end