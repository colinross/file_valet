# Thre Frontend Controller provides the needed controllers to deliver the frontend (html) to the browser
class FrontendController < ActionController::Base
  layout 'application'
  def index
    # Don't render anything (at the action-level)
    # This allows Vue to just take over with a blank slate.
    # YMMV as far as if this is a good or bad thing, but it allows the front
    # back ends to stay very de-coupled yet co-exist in the same repo.
    render html: nil, layout: true
  end

  # Files displays the current Payloads created
  def files
    meta = {}.tap do |m|
      m[:endpoint_url] = payloads_url
      m[:columns] = %w[label description uuid created_at].collect {|col| { field: col, label: col.titleize } }
    end
    render 'shared/resource_grid', locals: { resource_metadata: meta }
  end
end
