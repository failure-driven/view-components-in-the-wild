require "rails_helper"

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

describe "v2_users/new", type: :view do
  before do
    @v2_user = model_double_for_routing("v2_user")
  end

  it "sets a page title" do
    render
    expect(view.content_for(:page_title).strip).to eq("New V2 User")
  end

  it "renders a page heading" do
    render
    h1_heading = Capybara.string(rendered).find("h1")
    expect(h1_heading.text).to eq "New V2 User"
  end

  it "renders a form to create a user" do
    render
    form = Capybara.string(rendered).find("form")
    expect(form["action"]).to eq v2_users_path
  end

  it "renders an email input filed" do
    render
    email_field = Capybara.string(rendered).find('label[for="v2_user_email"]').find(:xpath, "..")
    expect(email_field.find("label").text).to eq "Email"
    expect(email_field.find("label")["for"]).to eq "v2_user_email"
    expect(email_field.find("input")["id"]).to eq "v2_user_email"
    expect(email_field.find("input")["type"]).to eq "email"
    expect(email_field.find("input")["name"]).to eq "v2_user[email]"
  end

  it "renders a submit form button" do
    render
    submit = Capybara.string(rendered).find('button[type="submit"]')
    expect(submit.text.strip).to eq "Create V2 user"
  end
end

