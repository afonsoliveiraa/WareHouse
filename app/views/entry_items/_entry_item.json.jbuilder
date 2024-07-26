json.extract! entry_item, :id, :entry_id, :item_id, :quantity, :unit_price, :created_at, :updated_at
json.url entry_item_url(entry_item, format: :json)
