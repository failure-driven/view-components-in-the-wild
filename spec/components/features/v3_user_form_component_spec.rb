require "rails_helper"

describe Features::V3UserForm::V3UserFormComponent, type: :component do
  before do
    @v3_user = model_double_for_routing("v3_user")
    @component = Features::V3UserForm::V3UserFormComponent.new(v3_user: @v3_user)

    @error_component = double("error component")
    allow(Forms::Error::ErrorComponent).to receive(:new).and_return(@error_component)
    allow(@component).to receive(:render).with(@error_component)

    @field_component = double("field component")
    allow(Forms::Field::FieldComponent).to receive(:new).and_return(@field_component)
    allow(@component).to receive(:render).with(@field_component)

    @submit_component = double("submit component")
    allow(Forms::Submit::SubmitComponent).to receive(:new).and_return(@submit_component)
    allow(@component).to receive(:render).with(@submit_component)
  end

  it "renders a v3 user form" do
    render_inline(@component)

    form = page.find("form")
    expect(form["action"]).to eq "/v3_users"
  end

  context "no errors" do
    it "does not render the error component" do
      expect(@component).not_to receive(:render).with(@error_component)
      render_inline(@component)
    end
  end

  context "with errors" do
    before do
      allow(@v3_user).to receive(:errors).and_return(["error 1", "error 2"])
    end

    it "renders the error component" do
      expect(Forms::Error::ErrorComponent).to receive(:new).with(title: "2 errors prohibited this v3_user from being saved:")
      expect(@component).to receive(:render).with(@error_component)
      render_inline(@component)
    end

    # TODO: expand to test the errors passed in
  end

  def call_field_component_with(args)
    field_component = double("field comonent")
    expect(Forms::Field::FieldComponent).to receive(:new).with(
      {
        form: a_kind_of(ActionView::Helpers::FormBuilder),
      }.merge(args)
    ).and_return(field_component)
    expect(@component).to receive(:render).with(field_component).and_return("rendered field component")
  end

  it "renders a name field" do
    call_field_component_with(name: :name)
    render_inline(@component)
    expect(page.text).to include("rendered field component")
  end

  it "renders an email field" do
    call_field_component_with(name: :email, field_type: :email_field)
    render_inline(@component)
    expect(page.text).to include("rendered field component")
  end

  it "renders an age field" do
    call_field_component_with(name: :age)
    render_inline(@component)
    expect(page.text).to include("rendered field component")
  end

  it "renders a password field" do
    call_field_component_with(name: :password, field_type: :password_field)
    render_inline(@component)
    expect(page.text).to include("rendered field component")
  end

  it "renders a submit button" do
    # TODO: expand to test this
  end
end
