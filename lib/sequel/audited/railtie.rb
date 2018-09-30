module Sequel
  module Audited
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        Sequel::Audited::Railtie.env = env
        @app.call(env)
      end
    end
	
    class Railtie < ::Rails::Engine
      initializer "sequel_audited_railtie.configure_rails_initialization" do |app|
        app.middleware.use Sequel::Audited::Middleware
      end
      attr_accessor :env
    end
  end
end
