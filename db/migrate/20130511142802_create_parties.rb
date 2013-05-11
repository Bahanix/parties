class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :start_at
      t.string :slug

      t.timestamps
    end
  end
end
