class Admin::ParticipantsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.search(params[:search]).paginate(page: params[:page], per_page: 10)
  end

  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @plans = Plan.all
    @participant = Participant.new
  end

  def edit
    @plans = Plan.all
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

  def update_checkin
    @participant = Participant.find(params[:id])
    @participant.update_attribute(:checkin, true)
    render json: [{ message: 'Success' }]
  end

  def update_kit
    @participant = Participant.find(params[:id])
    @participant.update_attribute(:kit, true)
    render json: [{ message: 'Success' }]
  end

  def update_paid
    @participant = Participant.find(params[:id])
    @participant.update_attribute(:paid, true)
    render json: [{ message: 'Success' }]
  end

  def update_credentials
    @participant = Participant.find(params[:id])
    @participant.update_attribute(:credentials, true)
    render json: [{ message: 'Success' }]
  end

  def destroy
    @participant.destroy
    redirect_to admin_participants_path, notice: 'Participant was successfully destroyed.'
  end

  def generate_credentials
    if params[:participant_ids].present?
      ids = params[:participant_ids]
      create_credentials(Participant.find(ids))
      render json: [{ message: 'Credentials generated for choice participants',
                      credentials_path: 'credentials.pdf' }]
    else
      create_credentials(Participant.all)
      render json: [{ message: 'Credentials generated for all participants' }]
    end
  end

  def create_credentials(participants)
    Prawn::Document.generate('public/credentials.pdf', background: 'public/background.jpg') do
      participants.each do |participant|
        participant.update_attribute(:credentials, true)
        move_down 80
        text participant.name
        text participant.email
        text participant.company
        text participant.github
        text participant.twitter
        start_new_page unless participant == participants.last
      end
    end
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:name, :email, :checkin, :kit, :twitter, :github, :company, :paid, :credentials, :plan_id)
  end
end
