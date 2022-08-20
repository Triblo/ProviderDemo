class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.integer :npi
      t.text :name
      t.text :address
      t.text :city
      t.text :state
      t.text :zip
      t.text :code
      t.text :license
      t.text :type

      t.timestamps
    end
  end
end
