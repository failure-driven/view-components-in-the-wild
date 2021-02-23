class Forms::Submit::SubmitComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_one :text

  def initialize()
  end
end
