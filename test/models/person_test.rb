require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "seeding db worked" do
    assert Person.all.size > 1
  end

  test "filter db by name" do
    person = Person.new(name: "Joel Ju")
    person.save
    people = Person.where(["lower(name) LIKE :name", { name: "Joel Ju" }])
    assert(people.first.name == "Joel Ju")
  end

  test "filter db by partial name" do
    person = Person.new(name: "Joel Ju2")
    person.save
    people = Person.where("lower(name) LIKE ?", "%oe%")
    people.each do |p|
      assert p.name.downcase.include? "oe"
    end
  end

  test "filter db by email" do
    person = Person.new(email: "joey@boo.com")
    person.save
    people = Person.where("lower(email) LIKE ?", "%boo%")
    people.each do |p|
      assert p.email.downcase.include? "boo"
    end
  end

  test "filter db by both email and name" do
    person = Person.new(name: "joy", email: "joey@boo.com")
    person.save
    people = Person.where("lower(name) LIKE ?", "%jo%")
      .where("lower(email) LIKE ?", "%boo%")
    people.each do |p|
      assert p.name.downcase.include? "jo"
      assert p.email.downcase.include? "boo"
    end
  end

  test "filter db by both email and name with null?" do
    Person.new(name: "joy", email: "joey@boo.com").save
    Person.new(name: "bob", email: "jo@foo.com").save
    people = Person.where("lower(name) LIKE ?", "%")
      .where("lower(email) LIKE ?", "%boo%")
    people.each do |p|
      assert p.name.downcase.include? "jo"
      assert p.email.downcase.include? "boo"
    end
  end

  test "filter by name in Person" do
    Person.new(name: "Jooo", email: "aaa@bbb.com").save
    Person.new(name: "Foop", email: "ccc@ddd.com").save

    people = Person.filter(name: "oo")
    assert people.size >= 2
    people.each do |p|
      assert p.name.downcase.include? "oo"
    end
  end
end