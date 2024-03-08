class InviteesController < ApplicationController
  def new
    @event = Event.find(params[:format])
    @invitee = Invitee.new
  end

  def create
    @invitee = Invitee.new(invitee_params)
    @event = Event.find(@invitee.event_id)

    if @invitee.save
      flash[:notice] = "Invitation send to #{@invitee.email}"
      redirect_to @event
    else
      flash[:alert] = 'Error when sending invitation'
      render :new, status: 422
    end
  end

  private

  def invitee_params
    params.require(:invitee).permit(:email, :event_id)
  end

end
