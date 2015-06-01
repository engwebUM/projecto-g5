class HomeController < ApplicationController
  def index
    @participant = Participant.new
  end

  def tickets
  end	
end
