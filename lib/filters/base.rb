require 'hayrick'
module Filters
  class Base
    include Hayrick

    def initialize(scope)
      @scope = scope
    end

    def available_params
      []
    end

    def oxy_params
      []
    end

  end
end
