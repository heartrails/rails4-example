require 'rails_helper'

<% module_namespacing do -%>
describe <%= class_name %>Controller do

<% for action in actions -%>
  describe "GET '<%= action %>'" do
    subject(:action){ get '<%= action %>' }
    it "returns http success" do
      expect(subject).to be_success
    end
  end

<% end -%>
end
<% end -%>
