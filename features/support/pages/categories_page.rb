class CategoriesPage < SitePrism::Page
  set_url '/categories'

  element :create_new_button  , 'button[name="create-new"]'
  element :new_cat_name_field , 'input[id="main_category_name"]'
  element :new_cat_desc_field , 'input[id="main_category_description"]'
  element :add_sub_cats_btn   , 'button[id="more-sub-cats-btn"]'
  element :save_new           , 'button[id="modal-save"]'
  elements :sub_cats_fields   , '.sub-cat-textfield'
  # elements :sub_cats_fields   , '#sub-cats-div input[type="text"]'

  def type_in_category cat_name
    new_cat_name_field.set(cat_name)
  end

  def type_in_description cat_desc
    new_cat_name_field.set(cat_desc)
  end

  def type_in_sub_categories sub_categories_list
    sub_categories_list.each do |sub_cat|
      add_sub_cats_btn.click
      sub_cats_fields.last.set(sub_cat)
    end
  end
end
