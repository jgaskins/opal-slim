require 'slim'
require 'opal'
require 'sprockets'

module Opal
  module Slim
    def self.compiled_slim source
      engine = ::Slim::Engine.with_options(pretty: false) { ::Slim::Engine.new }
      engine.call(source).gsub(/(slim_controls\w+) <</, '\1 +=')
    end

    def self.wrap compiled, file
      <<-EOF
        Template.new('#{file}') do |slim|
          #{compiled}
        end
      EOF
    end

    def self.compile source, file='(slim)'
      Opal.compile(wrap(compiled_slim(source), file))
    end

    class Processor < Tilt::Template
      self.default_mime_type = 'application/javascript'

      def self.engine_initialized?
        true
      end

      def initialize_engine
        require_template_library 'opal'
      end

      def prepare
      end

      def evaluate context, locals, &block
        context.require_asset 'opal-slim'
        Opal::Slim.compile data, context.logical_path.sub(/^templates\//, '')
      end
    end

    class SlimProcessor < Opal::BuilderProcessors::RubyProcessor
      handles :slim

      def initialize *args
        super
        @source = prepare(@source, @filename)
      end

      def requires
        ['opal-slim', 'erb'] + super
      end

      def prepare source, path
        slim = ::Opal::Slim.compiled_slim(source)
        ::Opal::Slim.wrap(slim, path)
      end
    end
  end
end

Opal.append_path File.expand_path('../../../opal', __FILE__).untaint
Sprockets.register_engine '.slim', Opal::Slim::Processor
