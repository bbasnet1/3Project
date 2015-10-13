class CreatePharmacists < ActiveRecord::Migration
  def change
    create_table :pharmacists do |t|
      t.string :name_first
      t.string :name_last

      t.timestamps null: false
    end
  end
end
