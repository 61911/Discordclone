class AddRoomIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :room_id, :string
    
  end
end
