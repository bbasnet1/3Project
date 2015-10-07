class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.integer :patient_id
      t.text :condition
      t.text :notes

      t.timestamps null: false
    end
  end
end
