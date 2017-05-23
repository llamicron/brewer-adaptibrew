require "brewer/adaptibrew/version"
require "brewer/adaptibrew/manager"

module Brewer
  module Adaptibrew
    def init
      manager = Manager.new
      manager.refresh
    end
  end
end
