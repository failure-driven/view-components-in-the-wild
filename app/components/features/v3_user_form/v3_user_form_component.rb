class Features::V3UserForm::V3UserFormComponent < ViewComponent::Base
  def initialize(v3_user:)
    @v3_user = v3_user
  end
end
