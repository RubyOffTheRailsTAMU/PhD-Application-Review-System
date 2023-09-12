class WelcomeController < ApplicationController
  # Skip the authorize method from ApplicationController
  skip_before_action :authorize, only: [:test]
  def hello
    render json: { message: "Hello, World! Test API!" }
  end

  def test
    render json: { message: "Test1 API!" }
  end
end
