class AddClientIdToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :client_id, :string, limit: 16
  end
end
