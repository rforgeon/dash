class AddLyftTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lyft_token, :string
    add_column :users, :lyft_refresh_token, :string
    add_column :users, :lyft_expires_at, :string

  end
end
