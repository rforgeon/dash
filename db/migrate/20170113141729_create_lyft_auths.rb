class CreateLyftAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :lyft_auths do |t|
      t.text :token

      t.timestamps
    end
  end
end
