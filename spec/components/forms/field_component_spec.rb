require "rails_helper"

describe Forms::Field::FieldComponent, type: :component do
  before do
    @form = double("a form builder")
    allow(@form).to receive(:label).and_return("the rendered label")
    allow(@form).to receive(:public_send).and_return("the rendered input")
  end

  it "renders a label" do
    expect(@form).to receive(:label).with(:the_field_name)
    render_inline(
      Forms::Field::FieldComponent.new(
        form: @form,
        name: :the_field_name,
      ),
    )

    expect(page.text).to include("the rendered label")
  end

  it "renders a text_field as the default input" do
    expect(@form).to receive(:public_send).with(
      :text_field,
      :the_field_name,
      class: "form-control",
    )
    render_inline(
      Forms::Field::FieldComponent.new(
        form: @form,
        name: :the_field_name,
      ),
    )

    expect(page.text).to include("the rendered input")
  end

  it "overrides the default text_field with email_field" do
    expect(@form).to receive(:public_send).with(
      :email_field,
      :the_field_name,
      class: "form-control",
    )
    render_inline(
      Forms::Field::FieldComponent.new(
        form: @form,
        name: :the_field_name,
        field_type: :email_field,
      ),
    )
    expect(page.text).to include("the rendered input")
  end

  it "overrides the default text_field with password_field" do
    expect(@form).to receive(:public_send).with(
      :password_field,
      :the_field_name,
      class: "form-control",
    )
    render_inline(
      Forms::Field::FieldComponent.new(
        form: @form,
        name: :the_field_name,
        field_type: :password_field,
      ),
    )
    expect(page.text).to include("the rendered input")
  end

  it "complains bitterly if an unsupported field is passed in" do
    expect(@form).not_to receive(:public_send)
    expect do
      render_inline(
        Forms::Field::FieldComponent.new(
          form: @form,
          name: :the_field_name,
          field_type: :unsupported_field_type,
        ),
      )
    end.to raise_error(ArgumentError, "unsupported field type unsupported_field_type for FieldComponent")
  end
end

