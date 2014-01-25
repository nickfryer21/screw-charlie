class AddClientIdToDeck < ActiveRecord::Migration
  def change
    add_column :decks, :client_id, :string, limit: 16
  end
end
