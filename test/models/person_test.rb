require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "filter by name in Person" do
    people = Person.filter(name: "y")
    assert people.size == 2
    people.each do |p|
      assert p.name.downcase.include? "y"
    end
  end

  test "filter by email in Person" do
    people = Person.filter(email: "xyz")
    assert people.size == 2
    people.each do |p|
      assert p.email.downcase.include? "xyz"
    end
  end

  test "filter by telefon in Person" do
    people = Person.filter(phone: "3")
    assert people.size == 1
    people.each do |p|
      assert p.phone.downcase.include? "3"
    end
  end

  test "address includes for street" do
    person = Person.new(street: "foo")
    assert person.address_includes? "Fo"
  end

  test "address includes for city" do
    person = Person.new(city: "Boo")
    assert person.address_includes? "boo"
  end

  test "address includes for zip" do
    person = Person.new(zip: "99999")
    assert person.address_includes? "99"
  end

  test "address includes for country" do
    person = Person.new(country: "USA")
    assert person.address_includes? "sa"
  end

  test "filter by street in address for Person" do
    people = Person.filter(address: "Str")
    assert people.size == 3
    people.each do |p|
      assert p.address_includes? "Str"
    end
  end

  test "filter by city in address for Person" do
    people = Person.filter(address: "City")
    assert people.size == 2
    people.each do |p|
      assert p.address_includes? "City"
    end
  end

  test "filter by zip in address for Person" do
    people = Person.filter(address: "1234")
    assert people.size == 2
    people.each do |p|
      assert p.address_includes? "1234"
    end
  end

  test "filter by country in address for Person" do
    people = Person.filter(address: "Erma")
    assert people.size == 1
    people.each do |p|
      assert p.address_includes? "Erma"
    end
  end

  test "sort by name ascending" do
    people = Person.sort("name-asc")

    assert people.first.name == "Friend"
    assert people.second.name == "Joy"
    assert people.third.name == "Tony"
  end

  test "sort by name descending" do
    people = Person.sort("name-desc")

    assert people.first.name == "Tony"
    assert people.second.name == "Joy"
    assert people.third.name == "Friend"
  end

  test "sort by email ascending" do
    people = Person.sort("email-asc")

    assert people.first.email == "foo@xyz.com"
    assert people.second.email == "friend@boo.com"
    assert people.third.email == "myemail@xyz.com"
  end

  test "sort by email descending" do
    people = Person.sort("email-desc")

    assert people.first.email == "myemail@xyz.com"
    assert people.second.email == "friend@boo.com"
    assert people.third.email == "foo@xyz.com"
  end
end