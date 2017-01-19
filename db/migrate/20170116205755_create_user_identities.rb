class CreateUserIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :user_identities do |t|
      t.string :user_id
      t.string :provider
      t.string :token
      t.string :refresh_token
      t.integer :expires_at
      t.string :uid

      t.timestamps
    end
  end
end
