class AddUserIdToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :user, index: true
  end
end
