class CreateRateDetailedFclFreightCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :rate_detailed_fcl_freight_charges do |t|

      t.timestamps
    end
  end
end
