require 'elasticsearch/model'

class Movie < ApplicationRecord
  # include the searchable concern added in models/concerns
  include Searchable

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['name^5', 'description']
          }
        },
        suggest: {
          text: query,
          name: {
            term: {
              size: 1,
              field: :name
            }
          },
          description: {
            term: {
              size: 1,
              field: :description
            }
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            description: {},
          }
        }
      }
    )
  end


  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name 
      indexes :rating 
      indexes :description, analyzer: 'english' 
    end
  end
 
end