# frozen_string_literal: true

class Admin::HelloWorldController < AdminController
  def index
    @hello = "Hello Admin"
  end
end
