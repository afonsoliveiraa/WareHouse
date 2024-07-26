class Item < ApplicationRecord
  belongs_to :group
  belongs_to :unit
end
