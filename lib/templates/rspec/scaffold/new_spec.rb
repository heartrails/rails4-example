require 'spec_helper'

<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
describe "<%= ns_table_name %>/new" do
  before(:each) do
    assign(:<%= ns_file_name %>, FactoryGirl.build(:<%= ns_file_name %>))
  end

  it "renders new <%= ns_file_name %> form" do
    render

<% if webrat? -%>
    expect(rendered).to have_selector("form", :action => <%= table_name %>_path, :method => "post") do |form|
<% for attribute in output_attributes -%>
      expect(form).to have_selector("<%= attribute.input_type -%>#<%= ns_file_name %>_<%= attribute.name %>", :name => "<%= ns_file_name %>[<%= attribute.name %>]")
<% end -%>
    end
<% else -%>
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", <%= index_helper %>_path, "post" do
<% for attribute in output_attributes -%>
  <% attribute_name = attribute.name + (attribute.reference? ? "_id" : "") -%>
      assert_select "<%= attribute.input_type -%>#<%= ns_file_name %>_<%= attribute_name %>[name=?]", "<%= ns_file_name %>[<%= attribute_name %>]"
<% end -%>
    end
<% end -%>
  end
end
