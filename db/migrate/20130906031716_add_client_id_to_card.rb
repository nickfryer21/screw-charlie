class AddClientIdToCard < ActiveRecord::Migration
  def change
    add_column :cards, :client_id, :string, limit: 16
  end
end
