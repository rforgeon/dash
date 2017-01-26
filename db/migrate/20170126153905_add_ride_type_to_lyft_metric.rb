class AddRideTypeToLyftMetric < ActiveRecord::Migration[5.0]
  def change
    add_column :lyft_metrics, :ride_type, :string
    add_column :lyft_metrics, :primetime_percentage, :string
  end
end
