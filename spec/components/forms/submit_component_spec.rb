require "rails_helper"

describe Forms::Submit::SubmitComponent, type: :component do
  it "renders a button with text" do
    render_inline(
      Forms::Submit::SubmitComponent.new()
    ) { |component| component.text { "the button text" } }

    expect(page.find("button").text.strip).to eq "the button text"
  end
end
