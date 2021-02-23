class Forms::Error::ErrorComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_many :errors, "TextComponent"

  def initialize(title:)
    @title = title
  end

  class TextComponent < ViewComponent::Base
    attr_accessor :text
    def initialize(text:)
      @text = text
    end
  end
end
