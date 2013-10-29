SimpleForm.setup do |config|
  config.components = [ :placeholder, :label, :hint, :error, :contained_input ]
  config.label_class = 'control-label'
  config.form_class = 'simple_form form-horizontal'
  config.wrapper_class = 'control-group'
end

module SimpleForm
  module Components
    module ContainedInput
      def contained_input
        '<div class="controls">' + input + (error.nil? ? '' : error) + '</div>'
      end
    end
  end
  module Inputs
    class Base
      include SimpleForm::Components::ContainedInput
    end
  end
end
