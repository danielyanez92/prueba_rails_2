class Todo < ApplicationRecord
  has_many :completes
  has_many :users, through: :completes
end
