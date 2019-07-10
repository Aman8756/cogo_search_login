class LocationController < ApplicationController


  def index
    name = MongoLocation.generate_suggestion(db_fetch)
    render :json => {locations: name, success: true}
  end
end
