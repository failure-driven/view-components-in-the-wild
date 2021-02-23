require "rails_helper"

describe "v3_users/new", type: :view do
  before do
    @v3_user = model_double_for_routing("v3_user")
  end

  it "sets a page title" do
    render
    expect(view.content_for(:page_title).strip).to eq("New V3 User")
  end

  it "renders a page heading" do
    render
    h1_heading = Capybara.string(rendered).find("h1")
    expect(h1_heading.text).to eq "New V3 User"
  end

  it "renders a form to create a user" do
    render
    form = Capybara.string(rendered).find("form")
    expect(form["action"]).to eq v3_users_path
  end

  it "renders an email input filed" do
    render
    email_field = Capybara.string(rendered).find('label[for="v3_user_email"]').find(:xpath, "..")
    expect(email_field.find("label").text).to eq "Email"
    expect(email_field.find("label")["for"]).to eq "v3_user_email"
    expect(email_field.find("input")["id"]).to eq "v3_user_email"
    expect(email_field.find("input")["type"]).to eq "email"
    expect(email_field.find("input")["name"]).to eq "v3_user[email]"
  end

  it "renders a submit form button" do
    render
    submit = Capybara.string(rendered).find('button[type="submit"]')
    expect(submit.text.strip).to eq "Create V3 user"
  end
end

