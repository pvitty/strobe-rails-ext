require 'strobe/action_controller/haltable'
require 'strobe/action_controller/param'

module Strobe
  module ActionController
    # A configured ActionController::Metal that includes
    # only the basic functionality.
    class Metal < ::ActionController::Metal
      abstract!

      include ::ActionController::UrlFor
      include ::ActionController::Head
      include ::ActionController::Redirecting
      include ::ActionController::Rendering
      include ::ActionController::Renderers::All
      include ::ActionController::ConditionalGet
      include ::ActionController::RackDelegation
      include ::ActionController::Caching
      include ::ActionController::MimeResponds
      include ::ActionController::ImplicitRender
      
      # Add instrumentations hooks at the bottom, to ensure they instrument
      # all the methods properly.
      include ::ActionController::Instrumentation
      
      # Before callbacks should also be executed the earliest as possible, so
      # also include them at the bottom.
      include ::AbstractController::Callbacks
      
      # The same with rescue, append it at the end to wrap as much as possible.
      include ::ActionController::Rescue

      include Haltable
      include Param
    end
  end
end