class Admin::EventsController < ApplicationController
  
  before_action :authenticate
  layout "admin"

  def index
    @events = Event.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == "username" && password == "password"
    end
  end
end
