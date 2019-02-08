class Person < ApplicationRecord
  def self.filter(name: nil, email: nil, phone: nil)
    name = name ? "%#{name.downcase}%" : "%"
    email = email ? "%#{email.downcase}%" : "%"
    phone = phone ? "%#{phone.downcase}%" : "%"

    Person.where("lower(name) LIKE ?", name)
      .where("lower(email) LIKE ?", email)
      .where("lower(phone) LIKE ?", phone)
  end
end
