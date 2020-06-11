class Autocompleter
  attr_accessor :query, :model, :fields

  def initialize(query, model, fields, hint_field)
    @query = query
    @model = model
    @fields = fields
    @hint_field = hint_field
  end

  def self.call(query, options)
    new(query, options[:model], options[:fields], options[:hint_field]).call
  end

  def call
    results.map do |result|
      {
        hint: build_hint(result),
        record_type: result.class.name,
        record_id: result.id
      }
    end
  end

  private  

  def results
    Elasticsearch::Model.search(
      search_query,
      [@model].freeze
    ).records
  end

  def build_hint(record)
    HintBuilder.call(record, @hint_field)
  end


  def search_query
    {
      "size": 50,
      "query": {
        "function_score": { 
          "query": {
            "bool": {
              "must": [multi_match]
            }
          },
        "functions": priorities
        }
      }
    }
  end

  def multi_match
    {
      "multi_match": {
        "query": @query,
        "fields": @fields,
        "fuzziness": 'auto'
      }
    }
  end

  def priorities
    [
      {
        "filter": {
          "term": { "_type": 'elasticsearch_test' }
        },
        "weight": 5000
      }
    ]
  end
end