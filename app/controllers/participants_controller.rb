class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to root_path, notice: 'Your register was successfully created.'
    else
      redirect_to root_path, notice: 'Error in your registration'
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email, :checkin, :kit, :twitter, :github, :company, :paid, :credentials, :plan_id)
  end
end
