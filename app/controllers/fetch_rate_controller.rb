class FetchRateController < ApplicationController
  ActiveRecord::Base.establish_connection "rate_development".to_sym
  def fetch_rate
    id1 = params[:origin_port_id]
    id2 = params[:destination_port_id]
    container_size = params[:container_size]
    container_type = params[:container_type]
    commodity = params[:commodity]
    response = RateDetailedFclFreightCharge.where(:origin_port_id => id1, :destination_port_id => id2, :container_size => container_size,
                                                  :container_type => container_type, :commodity => commodity)
    data_to_fetch = [:origin_port_id, :destination_port_id, :shipping_line_id, :container_type, :container_size, :commodity, :total_price, :start, :end]
    render :json => { success: true, result: response.as_json(only: data_to_fetch)}
  end
end
