module Api
  class ApplicationController < ::ApplicationController
    include JSONAPI::Rails::Controller   # für JSON:API-Rendering
    # API-spezifische before_actions, Auth …
  end
end
