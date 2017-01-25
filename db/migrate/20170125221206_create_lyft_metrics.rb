class CreateLyftMetrics < ActiveRecord::Migration[5.0]
  def change
    create_table :lyft_metrics do |t|
      t.string :ride_id
      t.integer :eta_seconds
      t.string :pickup_time
      t.string :dropoff_time
      t.integer :eta_dif_seconds

      t.timestamps
    end
  end
end
