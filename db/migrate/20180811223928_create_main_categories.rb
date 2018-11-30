class CreateMainCategories < ActiveRecord::Migration
  def change
    create_table :main_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
