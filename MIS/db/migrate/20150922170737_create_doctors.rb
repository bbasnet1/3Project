class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
	t.string :name_first
	t.string :name_last
	t.string :specialty
      t.timestamps null: false
    end
  end
end
