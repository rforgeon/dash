class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :lyft_auths, :token, :code
  end
end
