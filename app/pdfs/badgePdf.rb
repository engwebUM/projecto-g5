class BadgePdf < Prawn::Document
  def initialize(badge,view)
    super()
    @badge=badge
    @view=view
    text "Badge #{@badge.object_id}
  end
end