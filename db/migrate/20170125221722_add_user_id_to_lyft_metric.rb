class AddUserIdToLyftMetric < ActiveRecord::Migration[5.0]
  def change
    add_column :lyft_metrics, :user_id, :integer
  end
end
