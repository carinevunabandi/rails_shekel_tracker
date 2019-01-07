class CategoriesPage < SitePrism::Page
  set_url '/categories'

  element :create_new_button  , 'button[name="create-new"]'
end
