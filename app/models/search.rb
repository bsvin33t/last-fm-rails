class Search
  include HTTParty
  base_uri 'ws.audioscrobbler.com'

  def initialize(query, current_user)
    @query = query
    @current_user = current_user
    @options = {query: {api_key: ENV['last_fm_api_key'], format: 'json'}}
    create_history
  end

  def similar_artists
    @options[:query][:method] = ApiMethodNames::GET_SIMILAR_ARTIST
    @options[:query][:artist] = @query
    self.class.get('/2.0', @options)
  end

  private

  def create_history
    SearchHistory.where(search_string: @query).first_or_create do |search_history|
      search_history.search_string = @query
      search_history.user = @current_user
    end
  end
end
