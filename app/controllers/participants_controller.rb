class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.all
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

    respond_to do |format|
      if @participant.save
        format.html { redirect_to participants_path, notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to participants_path, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:name, :email, :checkin)
  end
end
