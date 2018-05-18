# frozen_string_literal: true

class AdminController < ActionController::Base
  include ApplicationHelper
  include AdminHelper
  protect_from_forgery with: :exception
  layout "admin"
end
