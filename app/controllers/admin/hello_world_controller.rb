class Admin::HelloWorldController < AdminController
  def index
    @hello = 'Hello Admin'
  end
end
