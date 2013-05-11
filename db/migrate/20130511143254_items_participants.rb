class ItemsParticipants < ActiveRecord::Migration
  def change
    create_table :items_participants, :id => false do |t|
      t.references :item, :participant
    end
    add_index :items_participants, :item_id
    add_index :items_participants, :participant_id
  end
end
