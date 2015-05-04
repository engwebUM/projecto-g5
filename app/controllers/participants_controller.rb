class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to root_path, notice: 'Your register was successfully created.'
    else
      redirect_to root_path
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email, :checkin)
  end
end