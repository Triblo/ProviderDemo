class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.integer :npi
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :code
      t.string :license
      t.string :type

      t.timestamps
    end
  end
end
