class Entry < ApplicationRecord
  belongs_to :pa
  belongs_to :person
  has_many :entry_items
end
