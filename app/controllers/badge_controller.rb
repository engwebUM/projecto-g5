require "prawn"

class BadgeController < ApplicationController

  def index
    @participants=Participant.all()
  end

  PDF_OPTIONS = {
      :page_size => "A5",
      :page_layout => :landscape,
      :background => "badgep.jpg",
      :margin => [30, 75]
  }


  def pdf
    @participant=Participant.find_by_name()
    respond_to do |format|
      format.html
      format.pdf do
        Prawn::Document.new(PDF_OPTIONS) do |pdf|
          pdf.fill_color "40464e"
          pdf.move_down 110
          pdf.text "@participant.name", :size => 24, :align => :left, :style => :bold
          pdf.move_down 35
          pdf.text "@participant.twitter}", :size => 24, :align => :left, :style => :bold
          send_data pdf.render,filename: "badge_{@participant.twitter}", type: "application/pdf"
        end
      end
    end
  end