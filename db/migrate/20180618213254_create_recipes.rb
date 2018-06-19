class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :imgUrl
      t.string :name
      t.string :description
      t.integer :rating
      t.integer :totalTimeInSeconds
      t.integer :numberOfServings

      t.timestamps
    end
  end
end
