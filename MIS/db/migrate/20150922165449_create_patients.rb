class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
	t.string :name_first
	t.string :name_last
	t.string :gender
	t.integer :ssn
	t.string :address
	t.string :phone
	t.date :dob
	t.float :weight
	t.float :height

      t.timestamps null: false
    end
  end
end
