class FilterModel
  def self.call(model, model_filter_methods, filter_values)
    results = []
    model_filter_methods.each do |filter_name, filter_method|
      can_apply_filter = BOOLEANS.include?(filter_values[filter_name]) ||
                         filter_values[filter_name].present?

      if can_apply_filter
        results += model.send(filter_method, filter_values[filter_name])
      end
    end
    results
  end

  private

  BOOLEANS = [true, false]
end
