class AttendingsController < ApplicationController

  def new
    @attending = Attending.new
  end

  def create
    @user = current_user
    @event = Event.find(params[:format])
    @attending = Attending.new(attended_event_id: @event.id, event_attendee_id: @user.id)

    if @attending.save
      flash[:notice] = "You now participate in #{@event.title} ;)"
      redirect_to events_path
    else
      flash[:alert] = 'Ooops check the participation again'
      render :new, status: 422
    end
  end
end
