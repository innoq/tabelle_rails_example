class Person < ApplicationRecord
  def self.sortString(sort)
    if !sort.present? || !sort.include?("-") then
      return nil
    elsif sort == "address-desc" then
      return "street DESC, city DESC, zip DESC, country DESC"
    elsif sort.include? "address" then
      return "street, city, zip, country"
    end

    sort_prefs = sort.split("-")
    if (sort_prefs.length() != 2) then
      return nil
    end

    order = sort_prefs[0]
    if sort_prefs[1] == 'desc' then
      order = order + " DESC"
    end
    order
  end

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

  def address
    street + "\n" + city + ", " + zip + "\n" + country
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
