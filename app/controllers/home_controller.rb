class HomeController < ApplicationController
  def index
    @participant = Participant.new
  end
end
