require 'spec_helper'

describe "sessions/destroy.html.haml" do
  before do
    #assign(:sessions, FactoryGirl.build(sessions)
  end
  it do
    render
    #expect(view).to render_template(partial: "_sessions")
    #expect(rendered).to include("destroy")
  end
end
