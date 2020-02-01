class Guarantee::DefaultFilter
  def initialize
  end

  def filter(params)
    filters = FilterModel.call(filter_model, Guarantee::Filter::METHODS, params)
    Guarantee.elastic_search(filters)
  end

  private

  def filter_model
    Guarantee.includes(
      :user
    )
  end
end
