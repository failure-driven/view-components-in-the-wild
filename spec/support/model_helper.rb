module ModelHelper
  def model_double_for_routing(model_name)
    the_double = double(model_name)
    allow(the_double).to receive(:to_model).and_return(the_double)
    allow(the_double).to receive(:persisted?).and_return(nil)
    allow(the_double).to receive(:to_key).and_return([model_name])
    mock_error = double("error")
    allow(mock_error).to receive(:any?).and_return(false)
    allow(the_double).to receive(:errors).and_return(mock_error)
    model_name_instance = double(
      "model name",
      {
        singular: model_name,
        name: model_name.titleize,
        singular_route_key: model_name,
        param_key: model_name,
        route_key: model_name.pluralize,
        i18n_key: model_name.to_sym,
        human: model_name.humanize,
      },
    )
    allow(the_double).to receive(:model_name).and_return(model_name_instance)
    klass = double(
      "routed model calss",
      model_name: model_name_instance,
      name: model_name.titleize
    )
    allow(the_double).to receive(:class).and_return(klass)
    the_double
  end
end
