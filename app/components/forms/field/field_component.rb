class Forms::Field::FieldComponent < ViewComponent::Base
  def initialize(form:, name:, field_type: :text_field)
    @form = form
    @name = name

    raise ArgumentError, "unsupported field type #{field_type} for FieldComponent" unless %i[text_field email_field password_field].include?(field_type)

    @field_type = field_type
  end
end
