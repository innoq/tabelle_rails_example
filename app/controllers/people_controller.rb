class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @filter = filter_params
    @people = Person.filter(name: @filter[:name],
      email: @filter[:email],
      phone: @filter[:phone],
      address: @filter[:address])
  end

  private
    def filter_params
      params.permit(:name, :phone, :email, :address)
    end
end
