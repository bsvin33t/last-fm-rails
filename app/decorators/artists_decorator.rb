class ArtistsDecorator
  def initialize(artists)
    @artists = artists
  end

  def artist_set
    @artists["similarartists"]["artist"].in_groups_of(3, false) if @artists["similarartists"]["artist"].is_a?(Array)
  end

end