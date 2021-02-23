require "rails_helper"

describe Features::NewV3User::NewV3UserComponent, type: :component do
  before do
    @v3_user = double("v3 user")
    @component = Features::NewV3User::NewV3UserComponent.new(v3_user: @v3_user)
    @card_layout_component = double("card layout component")
    @v3_user_form_component = double("v3 user form component")
    allow(@card_layout_component).to receive(:header).and_yield
    allow(@card_layout_component).to receive(:body_title).and_yield
    allow(@card_layout_component).to receive(:footer).and_yield
    allow(Features::V3UserForm::V3UserFormComponent).to receive(:new).and_return(@v3_user_form_component)
    allow(@component).to receive(:render).with(@v3_user_form_component)
  end

  it "renders a card layout with a header" do
    expect(Layout::CardLayout::CardLayoutComponent).to receive(:new).and_return(@card_layout_component)
    expect(@component).to receive(:render).with(@card_layout_component).and_yield(@card_layout_component)
    expect(@card_layout_component).to receive(:header).and_yield

    render_inline(@component)

    expect(page.text).to include "featured"
  end

  it "renders a card layout with a body title" do
    expect(Layout::CardLayout::CardLayoutComponent).to receive(:new).and_return(@card_layout_component)
    expect(@component).to receive(:render).with(@card_layout_component).and_yield(@card_layout_component)
    expect(@card_layout_component).to receive(:body_title).and_yield

    render_inline(@component)

    expect(page.text).to include "New V3 User"
  end

  it "renders a user form component as content" do
    expect(Layout::CardLayout::CardLayoutComponent).to receive(:new).and_return(@card_layout_component)
    expect(@component).to receive(:render).with(@card_layout_component).and_yield(@card_layout_component)
    expect(Features::V3UserForm::V3UserFormComponent).to receive(:new).with(v3_user: @v3_user).and_return(@v3_user_form_component)
    expect(@component).to receive(:render).with(@v3_user_form_component).and_return("v3 user form component internals")

    render_inline(@component)

    expect(page.text).to include "v3 user form component internals"
  end

  it "renders a card layout with a footer" do
    expect(Layout::CardLayout::CardLayoutComponent).to receive(:new).and_return(@card_layout_component)
    expect(@component).to receive(:render).with(@card_layout_component).and_yield(@card_layout_component)
    expect(@card_layout_component).to receive(:footer).and_yield

    render_inline(@component)

    link = page.find("a")
    expect(link.text).to eq "Back"
    expect(link["href"]).to eq "/v3_users"
  end
end
