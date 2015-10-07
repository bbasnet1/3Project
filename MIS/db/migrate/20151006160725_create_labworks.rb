class CreateLabworks < ActiveRecord::Migration
  def change
    create_table :labworks do |t|
      t.integer :patient_id
      t.text :description
      t.boolean :complete
      t.string :data

      t.timestamps null: false
    end
  end
end
