class EventAttendeesController < ApplicationController

  before_action :find_event, :only => [ :index, :show, :new, :create, :edit, :update, :destroy ]
  before_action :find_attendee, :only => [ :show, :edit, :update, :destroy ]

  def index
    @attendees = @event.attendees
  end

  def show
  end

  def new
    @attendee = @event.attendees.build
  end

  def create
    @attendee = @event.attendees.build(attendee_params)
    if @attendee.save
      redirect_to event_attendees_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to event_attendees_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @attendee.destroy
    redirect_to event_attendees_path(@event)
  end

  protected

  def find_attendee
    @attendee = @event.attendees.find(params[:id])
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def attendee_params
    params.require(:attendee).permit(:name)
  end

end
