class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      # t.integer :id
      t.string :title
      t.string :making_time
      t.string :serves
      t.string :ingredients
      t.integer :cost
      # t.datetime :created_at
      # t.datetime :updated_at

      t.timestamps
    end
  end
end
