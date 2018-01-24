class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # add_breadcrumb :root
  def index
    flash[:danger] = "I'm flashing a message"
  end
end
