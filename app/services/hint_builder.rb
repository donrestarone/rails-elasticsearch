class HintBuilder
  attr_accessor :record

  def initialize(record, hint_field)
    @record = record
    @hint_field = hint_field
  end

  def self.call(record, hint_field)
    new(record, hint_field).call
  end

  def call
    ElasticsearchTestResultBuilder.new(@record).autocomplete_hint(@hint_field)
  end
end