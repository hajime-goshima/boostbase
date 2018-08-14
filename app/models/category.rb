class Category < ApplicationRecord
  has_closure_tree
  validates :title, presence: true
end
