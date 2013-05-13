module ActionController
  class InvalidParameterType < KeyError
    attr_reader :param # :nodoc:

    def initialize(param) # :nodoc:
      @param = param
      super("param needs hash: #{param}")
    end
  end

  class Parameters
    def require_hash(key)
      val = require(key)
      raise InvalidParameterType.new(key) unless val.is_a? Hash
      val
    end
  end
end

module ActionDispatch
  ExceptionWrapper.rescue_responses.merge!('ActionController::InvalidParameterType' => :bad_request)
end
