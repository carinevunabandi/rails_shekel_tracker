class MainCategory < ActiveRecord::Base
  validates_presence_of   :name
  validates_uniqueness_of :name, message: "A category under this name already exists"

  has_many :sub_categories
end
