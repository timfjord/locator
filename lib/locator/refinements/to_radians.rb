# frozen_string_literal: true

module Locator
  module Refinements
    module ToRadians
      module Implementation
        def to_radians
          self * Math::PI / 180
        end
      end

      refine Integer do
        include Implementation
      end

      refine Float do
        include Implementation
      end
    end
  end
end
