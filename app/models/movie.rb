require 'elasticsearch/model'

class Movie < ApplicationRecord
  # include the searchable concern added in models/concerns
  include Searchable


  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name 
      indexes :rating 
      indexes :description 
    end
  end
 
end