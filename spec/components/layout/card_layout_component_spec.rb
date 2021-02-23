require "rails_helper"

describe Layout::CardLayout::CardLayoutComponent, type: :component do
  it "renders a header" do
    render_inline(
      Layout::CardLayout::CardLayoutComponent.new()
    ) { |component| component.header { "the header text" } }

    expect(page.find(".card-header").text.strip).to eq "the header text"
  end

  it "renders a footer" do
    render_inline(
      Layout::CardLayout::CardLayoutComponent.new()
    ) { |component| component.footer { "the footer text" } }

    expect(page.find(".card-footer").text.strip).to eq "the footer text"
  end

  it "renders a body title" do
    render_inline(
      Layout::CardLayout::CardLayoutComponent.new()
    ) { |component| component.body_title { "the body title" } }

    expect(page.find(".card-body .card-title").text.strip).to eq "the body title"
  end

  it "renders content in the card text" do
    render_inline(
      Layout::CardLayout::CardLayoutComponent.new()
    ) { |component| "the content" }

    expect(page.find(".card-body .card-text").text.strip).to eq "the content"
  end
end
