require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "seeding db worked" do
    Person.all.size > 1
  end
end
