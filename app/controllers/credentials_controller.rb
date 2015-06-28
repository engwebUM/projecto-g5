class CredentialsController < ApplicationController
	def create
    if params[:participant_ids].present?
      ids = params[:participant_ids]
      Prawn::Document.generate("app/assets/images/credentials.pdf") do
        Participant.find(ids).each do |participant|
          text participant.name
        end
      end
      render :json => [{ :message => "Credentials generated for choice participants" }]
    else
      Prawn::Document.generate("app/assets/images/credentials.pdf") do
        Participant.all.each do |participant|
          text participant.name
        end
      end
      render :json => [{ :message => "Credentials generated for all participants" }]
    end
  end
end