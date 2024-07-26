json.extract! person, :id, :name, :email, :birthdate, :phone, :address, :document, :created_at, :updated_at
json.url person_url(person, format: :json)
