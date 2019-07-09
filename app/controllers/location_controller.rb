class LocationController < ApplicationController
  def index
    name = MongoLocation.generate_suggestion(params)
    render :json => {locations: name, success: true}
  end

end
