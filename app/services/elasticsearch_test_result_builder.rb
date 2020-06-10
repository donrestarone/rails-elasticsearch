class ElasticsearchTestResultBuilder < ResultBuilderBase
  def autocomplete_hint(field_name)
    "#{record.send(field_name)}"
  end
end