class Api::V1::SearchController < ApplicationController
  def create
    @movies = params["query"].nil? ? [] : Movie.search(params["query"])
    if @movies.results.total > 0
      render json: @movies
    else
      render json: Autocompleter.call(
        params["query"], 
        {
          model: Movie,
          fields: ['name', 'description'],
          hint_field: 'name'
        }     
      )
    end
  end
end
