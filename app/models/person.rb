class Person < ApplicationRecord
  def self.filter(name: nil, email: nil)
    name = name ? "%#{name.downcase}%" : "%"
    email = email ? "%#{email.downcase}%" : "%"

    Person.where("lower(name) LIKE ?", name)
      .where("lower(name) LIKE ?", email)
  end
end
