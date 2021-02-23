class Features::NewV3User::NewV3UserComponent < ViewComponent::Base
  def initialize(v3_user:)
    @v3_user = v3_user
  end
end
