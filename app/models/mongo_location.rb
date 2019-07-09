class MongoLocation
  include Mongoid::Document
  store_in collection: 'locations'
  scope :active, -> { where(:status => :active) }
  scope :inactive, -> { where(:status => :inactive) }
  field :display_name, type: String
  field :location_id, type: String
  field :port_id, type: String

  def self.generate_suggestion(params)
    query = params[:q]
    locations = MongoLocation.all.active.where(:type => 'port')
    locations = locations.any_of({ :display_name => /#{Regexp.escape query}/i}) unless query.blank?
    data_to_fetch = [:display_name, :_id]
    return locations.as_json(only: data_to_fetch)
  end

=begin
  def self.fetch_location_id(str)
    locations = MongoLocation.all.active.where(:display_name => str)
    data_to_fetch = [:_id]
    return locations.as_json(only: data_to_fetch)
  end
=end
end

