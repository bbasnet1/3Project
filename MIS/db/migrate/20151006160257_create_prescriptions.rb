class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.string :name
      t.float :dosage

      t.timestamps null: false
    end
  end
end
