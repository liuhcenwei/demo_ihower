class Admin::EventsController < ApplicationController
  
  before_action :authenticate
  before_action :find_event, :only => [ :show, :edit, :update ]
  layout "admin"

  def bulk_update
    ids = Array(params[:ids])
    events = ids.map{ |i| Event.find_by_id(i) }.compact

    if params[:commit] == "Publish"
      events.each{ |e| e.update(:status => "published") }
    elsif params[:commit] == "Delete"
      events.each{ |e| e.destroy }
    end

    redirect_to admin_events_path
  end

  def index
    @events = Event.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event)
    else
      render :edit
    end
  end

  def destroy
  end

  protected

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:capacity, :name, :description, :category_id, :location_attributes => [:id, :name, :_destroy], :group_ids => [])
  end

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == "username" && password == "password"
    end
  end
end
