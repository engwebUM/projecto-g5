class Admin::ParticipantsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @participant = Participant.new
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to admin_participants_path, notice: 'Participant was successfully created.'
    else
      render :new
    end
  end

  def update
    if @participant.update(participant_params)
      redirect_to admin_participants_path, notice: 'Participant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    Participant.tire.index.remove @participant
    @participant.destroy
    redirect_to admin_participants_path, notice: 'Participant was successfully destroyed.'
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:name, :email, :checkin, :kit, :twitter, :github, :company, :paid, :credentials, :plan_id)
  end
end
