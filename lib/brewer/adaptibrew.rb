require "brewer/adaptibrew/version"
require "brewer/adaptibrew/manager"

module Brewer
  module Adaptibrew
    def self.build
      Manager.new.clone
      true
    end
  end
end
