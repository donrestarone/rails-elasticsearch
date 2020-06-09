class Api::V1::SearchController < ApplicationController
  def create
    @posts = params["query"].nil? ? [] : Movie.search(params["query"])
    render json: @posts
  end
end
