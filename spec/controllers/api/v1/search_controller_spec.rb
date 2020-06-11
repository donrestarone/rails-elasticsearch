require 'rails_helper'

RSpec.describe Api::V1::SearchController, type: :controller do
  before(:all) do
    Movie.create(name: "The Nightmare Before Christmas", rating: 5, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Titanic", rating: 5, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Venom", rating: 4, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "A Quiet Place", rating: 5, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Nobody's Fool", rating: 2, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Suspiria", rating: 4, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Hereditary", rating: 4, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Office Space", rating: 5, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Elf", rating: 4, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Dawn of the Planet of the Apes", rating: 3, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Secret life of Pets", rating: 4, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Overlord", rating: 3, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Wonder Woman", rating: 5, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Bohemian Rhapsody", rating: 4, description: Faker::Movies::BackToTheFuture.quote)
    Movie.create(name: "Ocean's 8", rating: 5, description: Faker::Movies::BackToTheFuture.quote)
  end

  it 'renders the movie when the beginning of the movie name is specified (nightmare before christmas)' do
    movie_title = 'nightmare before'
    post :create, params: {
      query: movie_title
    }
    response_body = JSON.parse(response.body)
    byebug
    first_result = response_body[0]
    expect(first_result["_source"]["name"]).to eql 'The Nightmare Before Christmas'
  end

  it 'renders the movie when the end of the movie name is specified (nightmare before christmas)' do
    movie_title = 'Before Christmas'
    post :create, params: {
      query: movie_title
    }
    response_body = JSON.parse(response.body)
    first_result = response_body[0]
    expect(first_result["_source"]["name"]).to eql 'The Nightmare Before Christmas'
  end

  it "renders the movie when apostrophes are omitted (Ocean's 8)" do
    movie_title = 'oceans 8'
    post :create, params: {
      query: movie_title
    }
    response_body = JSON.parse(response.body)
    first_result = response_body[0]
    expect(first_result["_source"]["name"]).to eql "Ocean's 8"
  end


  it "renders the movie when spaces are added (Overlord)" do
    skip('figure this case out')
    movie_title = 'Over lord'
    post :create, params: {
      query: movie_title
    }
    response_body = JSON.parse(response.body)
    first_result = response_body[0]
    expect(first_result["_source"]["name"]).to eql "Overlord"
  end

  it "renders the movie when spaces are omitted (Office Space)" do
    movie_title = 'OfficeSpace'
    post :create, params: {
      query: movie_title
    }
    response_body = JSON.parse(response.body)
    first_result = response_body[0]
    expect(first_result["_source"]["name"]).to eql "Office Space"
  end
end