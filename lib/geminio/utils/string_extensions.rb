module Geminio
  module StringExtensions
    def camel_case
      self.split(/_|-/).collect(&:capitalize).join
    end

    def underscore
      self.gsub(/-/, '_')
    end
  end
end
