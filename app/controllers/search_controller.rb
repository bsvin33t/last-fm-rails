class SearchController < ApplicationController

  before_action :authenticate_user!

  def create
    @artists = Search.new(search_params[:query], current_user).similar_artists
    render :show
  end

  def show
    redirect_to(user_path)
  end


  private

  def search_params
    params.require(:search).permit(:query)
  end
end
