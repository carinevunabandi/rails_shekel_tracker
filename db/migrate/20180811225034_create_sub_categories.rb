class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.references :main_category, index: true

      t.timestamps null: false
    end
    add_foreign_key :sub_categories, :main_categories
  end
end
