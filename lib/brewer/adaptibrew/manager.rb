module Brewer
  module Adaptibrew
    class Manager

      attr_accessor :disable_network_operations, :brewer_dir

      def initialize
        # @disable_network_operations = network? ? false : true
        @brewer_dir = Dir.home + "/.brewer/"
        @adaptibrew_url = 'https://github.com/llamicron/adaptibrew.git'

        unless Dir.exists?(@brewer_dir)
          Dir.mkdir(@brewer_dir)
        end
      end

      def clone
        if @disable_network_operations
          return false
        end

        if !present?
          Git.clone(@adaptibrew_url, 'adaptibrew', :path => brewer_dir)
          return true
        end
        false
      end

      def clear
        if @disable_network_operations
          return false
        end

        if present?
          FileUtils.rm_rf(adaptibrew_dir)
          return true
        end
        false
      end

      def refresh
        if clear and clone
          return true
        end
        false
      end

      def present?
        if Dir.exists?(adaptibrew_dir)
          if Dir.entries(adaptibrew_dir).length > 2
            return true
          end
        end
        false
      end

    end
  end
end
