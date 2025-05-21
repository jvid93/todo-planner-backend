module Api
  class BaseController < ApplicationController
    include JSONAPI::Rails::Controller
  end
end