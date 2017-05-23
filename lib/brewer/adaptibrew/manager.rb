require 'git'

module Brewer
  module Adaptibrew
    class Manager

      attr_reader :brewer_dir, :adaptibrew_dir, :adaptibrew_url

      def initialize
        @brewer_dir = Dir.home + "/.brewer/"
        @adaptibrew_dir = @brewer_dir + "adaptibrew/"
        @adaptibrew_url = 'https://github.com/llamicron/adaptibrew.git'

        build
      end

      def clone
        if !present?
          Git.clone(@adaptibrew_url, 'adaptibrew', :path => brewer_dir)
          return true
        end
        false
      end

      def clear
        if present?
          FileUtils.rm_rf(@adaptibrew_dir)
          return true
        end
        false
      end

      def refresh
        if clear and clone
          return true
        end
        # :nocov:
        false
        # :nocov:
      end

      def present?
        if Dir.exists?(@adaptibrew_dir)
          if Dir.entries(@adaptibrew_dir).length > 2
            return true
          end
        end
        false
      end

      def build
        if !Dir.exists?(@brewer_dir)
          Dir.mkdir(@brewer_dir)
        end
        clone
      end

      # Deletes ~/.brewer
      def implode
        if Dir.exists?(@brewer_dir)
          FileUtils.rm_rf(@brewer_dir)
          return true
        end
        false
      end

    end
  end
end
