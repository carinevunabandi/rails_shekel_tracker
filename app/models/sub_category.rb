class SubCategory < ActiveRecord::Base
  belongs_to :main_category, foreign_key: 'main_category_id'
  validates_presence_of   :name
end
