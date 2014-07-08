require 'rails_helper'

<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
describe "<%= ns_table_name %>/index" do
  before(:each) do
    @<%= ns_table_name %> = assign(:<%= table_name %>, FactoryGirl.create_list(:<%= ns_file_name %>, 2))
  end

  it "renders a list of <%= ns_table_name %>" do
    render
<% unless webrat? -%>
    # Run the generator again with the --webrat flag if you want to use webrat matchers
<% end -%>
<% for attribute in output_attributes -%>
<% if webrat? -%>
    expect(rendered).to have_selector("tr>td", :content => <%= value_for(attribute) %>.to_s, :count => 2)
<% else -%>
    assert_select "tr>td", :text => @<%= ns_table_name %>[0].<%= attribute %>, :count => 1
    assert_select "tr>td", :text => @<%= ns_table_name %>[1].<%= attribute %>, :count => 1
<% end -%>
<% end -%>
  end
end
