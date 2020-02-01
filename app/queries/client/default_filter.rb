class Client::DefaultFilter
  def initialize
  end

  def filter(params)
    filters = FilterModel.call(filter_model, Client::Filter::METHODS, params)
    Client.elastic_search(filters)
  end

  private

  def filter_model
    Client.includes(
      :user
    )
  end
end
