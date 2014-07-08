require 'rails_helper'

<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
describe "<%= ns_table_name %>/show" do
  before(:each) do
    @<%= ns_file_name %> = assign(:<%= ns_file_name %>, FactoryGirl.create(:<%= ns_file_name %>))
  end

  it "renders attributes in <p>" do
    render
<% unless webrat? -%>
    # Run the generator again with the --webrat flag if you want to use webrat matchers
<% end -%>
<% for attribute in output_attributes -%>
<% if webrat? -%>
    expect(rendered).to contain(<%= value_for(attribute) %>.to_s)
<% else -%>
    expect(rendered).to match(/<%= eval(value_for(attribute)) %>/)
<% end -%>
<% end -%>
  end
end
