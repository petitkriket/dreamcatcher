class CreateClassfields < ActiveRecord::Migration[5.2]
  def change
    create_table :classfields do |t|
      t.string :offer_id
      t.string :url
      t.float :price
      t.float :size
      t.integer :rooms_count
      t.integer :bedrooms
      t.string :offer_type
      t.string :district_area
      t.text :full_description
      t.string :energy_ratio
      t.datetime :construction_date
      t.integer :offer_view_count
      t.string :agency
      t.string :origin

      t.timestamps
    end
  end
end
