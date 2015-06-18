class EventsController < ApplicationController

  before_action :find_event, :only => [ :show, :edit, :update, :destroy ]

  def latest
    @events = Event.order("id").limit(5)
  end

  def bulk_delete
    Event.destroy_all
    redirect_to events_path
  end

  def bulk_update
    ids = Array(params[:ids])
    events = ids.map{ |i| Event.find_by_id(i) }.compact

    if params[:commit] == "Publish"
      events.each{ |e| e.update(:status => "published") }
    elsif params[:commit] == "Delete"
      events.each{ |e| e.destroy }
    end

    redirect_to events_path
  end

  def index
    #@events = Event.all
    @events = Event.page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
      format.atom { @feed_title = "My event list" } # index.atom.builder
    end
  end

  def show
    @page_title = @event.name

    respond_to do |format|
      format.html { @page_title = @event.name }
      format.xml # show.xml.builder
      format.json { render :json => { :id => @event.id, :name => @event.name, :description => @event.description }.to_json }
      #format.json # this works
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "event was successfully created"
      redirect_to :action => :index
    else
      render :action => :new 
      # render: return the "template of new action", not do "new action", so user will get a form jest filt
      # redirect_to: then do the "new action", so user will get a brand new form
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "event was successfully updated"
      redirect_to :action => :show, :id => @event
    else
      render :edit
    end
  end

  def destroy
    
    @event.destroy
    flash[:alert] = "event was successfully deleted"
    redirect_to :action => :index
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id, :location_attributes => [:id, :name, :_destroy], :group_ids => [])
  end

end
