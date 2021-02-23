require "rails_helper"

describe Forms::Error::ErrorComponent, type: :component do
  it "renders a title" do
    render_inline(
      Forms::Error::ErrorComponent.new(
        title: "the error title",
      ),
    )

    expect(page.find("h2").text).to eq "the error title"
  end

  it "renders many errors" do
    render_inline(
      Forms::Error::ErrorComponent.new(title: "title")
    ) { |component| component.errors([{text: "error 1"}, {text: "error 2"}])}

    expect(page.find_all("ul li").map(&:text)).to eq(["error 1", "error 2"])
  end
end
