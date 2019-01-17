json.extract! person, :id, :name, :phone, :email, :street, :city, :zip, :country, :created_at, :updated_at
json.url person_url(person, format: :json)
