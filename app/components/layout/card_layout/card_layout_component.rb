class Layout::CardLayout::CardLayoutComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_one :header
  renders_one :body_title
  renders_one :footer

  def initialize()
  end
end

