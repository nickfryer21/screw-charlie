class AddPasswordToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :password, :string, limit: 20
  end
end
