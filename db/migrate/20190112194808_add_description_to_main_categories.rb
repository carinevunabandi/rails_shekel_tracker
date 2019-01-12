class AddDescriptionToMainCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :main_categories, :description, :string
  end
end
