# frozen_string_literal: true

class HelloWorldController < ApplicationController
  def index
    @hello = "Hello Guest"
  end
end
