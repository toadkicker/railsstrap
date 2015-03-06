class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb :root
  def index
  end
end
