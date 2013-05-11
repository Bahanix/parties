class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :party

      t.timestamps
    end
    add_index :items, :party_id
  end
end
