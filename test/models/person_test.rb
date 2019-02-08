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
end