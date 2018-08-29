class CategoriesFacade
  def all_main_cats_and_subs_in_hash
    all_main_categories = MainCategory.all.to_a
    main_and_subs = {}
    all_main_categories.each do |main_category|
      subs = SubCategory.where(main_category: main_category).map(&:name)
      main_and_subs[main_category.name] = subs
    end
    main_and_subs
  end

  def all_main_cats_and_subs_in_arrays
    all_main_cats_and_subs_in_hash.to_a
  end
end
