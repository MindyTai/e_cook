class AddUserIdToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :user
  end
end
