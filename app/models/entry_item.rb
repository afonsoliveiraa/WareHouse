class EntryItem < ApplicationRecord
  belongs_to :entry
  belongs_to :item
end
