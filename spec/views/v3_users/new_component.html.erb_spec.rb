require "rails_helper"

describe "v3_users/new", type: :view do
  before do
    @v3_user = model_double_for_routing("v3_user")
    allow(view).to receive(:render).and_call_original
    allow(
      Features::NewV3User::NewV3UserComponent
    ).to receive(:new).and_return(@new_v3_user_component)
    allow(view).to receive(:render).with(@new_v3_user_component)

    @new_v3_user_component = double("new v3 user component")
  end

  it "sets a page title" do
    render
    expect(view.content_for(:page_title).strip).to eq("New V3 User")
  end

  it "renders a new v3 user component" do
    expect(
      Features::NewV3User::NewV3UserComponent
    ).to receive(:new).with(
      v3_user: @v3_user
    ).and_return(@new_v3_user_component)
    expect(view).to receive(:render).with(
      @new_v3_user_component
    ).and_return("rendered component")

    render
    expect(rendered).to include "rendered component"
  end
end

