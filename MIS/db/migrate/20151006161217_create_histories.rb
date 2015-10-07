class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :patient_id
      t.text :description
      t.date :date

      t.timestamps null: false
    end
  end
end
