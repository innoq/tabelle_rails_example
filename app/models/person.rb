class Person < ApplicationRecord
  def self.filter(name: nil, email: nil, phone: nil, address: nil)
    name = name ? "%#{name.downcase}%" : "%"
    email = email ? "%#{email.downcase}%" : "%"
    phone = phone ? "%#{phone.downcase}%" : "%"
    address = address ? "%#{address.downcase}%" : "%"

    Person.where("lower(name) LIKE ?", name)
      .where("lower(email) LIKE ?", email)
      .where("lower(phone) LIKE ?", phone)
      .where("lower(street) LIKE ? OR lower(city) LIKE ? OR lower(zip) LIKE ? OR lower(country) LIKE ?",
        address, address, address, address)
  end

  def address_includes?(str)
    str = str ? str.downcase : ""
    street = self.street ? self.street.downcase : ""
    city = self.city ? self.city.downcase : ""
    zip = self.zip ? self.zip.downcase : ""
    country = self.country ? self.country.downcase : ""

    street.include?(str) || city.include?(str) || zip.include?(str) || country.include?(str)
  end
end
