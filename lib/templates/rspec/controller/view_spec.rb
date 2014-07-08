require 'rails_helper'

describe "<%= file_name %>/<%= @action %>.html.<%= options[:template_engine] %>" do
  before do
    #assign(:<%= file_name %>, FactoryGirl.build(:<%= file_name %>))
  end
  it do
    render
    #expect(view).to render_template(partial: "_<%= file_name %>")
    #expect(rendered).to include("<%= @action %>")
  end
end
