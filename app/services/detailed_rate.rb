
class DetailedRate
  def self.get_all(params)
    origin = params[:origin]
    dest = params[:destination]

    rate = RateDetailedFclFreightCharge.where(origin_port_id:origin, distination_port_id:dest)
    if(rate.present?)
      return {success:"pass", message:"rates are here"}
    end
  end
end