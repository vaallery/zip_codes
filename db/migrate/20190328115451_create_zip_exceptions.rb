class CreateZipExceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_exceptions do |t|
      t.integer :orig_start, index: true
      t.integer :orig_end, index: true
      t.integer :dest_start, index: true
      t.integer :dest_end, index: true
      t.integer :zone, index: true
      t.integer :mail_type
      t.integer :filler
    end
  end
end
