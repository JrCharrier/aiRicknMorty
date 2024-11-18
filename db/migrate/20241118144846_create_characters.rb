class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.string :gender
      t.string :planet
      t.string :image_url
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
