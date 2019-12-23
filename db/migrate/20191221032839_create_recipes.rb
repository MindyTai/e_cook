class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description

      t.timestamps #create_at #update_at
    end
  end
end
