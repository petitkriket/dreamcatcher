class CreateClassfieldImages < ActiveRecord::Migration[5.2]
  def change
    create_table :classfield_images do |t|
      t.references :classfield
      t.string :url

      t.timestamps
    end
  end
end
