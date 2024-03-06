class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @past_events = Event.past.all
    @futur_events = Event.future.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: 422 #unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: 422 #uprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = 'Event deletion completed'
      redirect_to :root
    else
      flash[:alert] = 'Event deletion failed'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :event_date)
  end
end
