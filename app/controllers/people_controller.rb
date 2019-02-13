class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @filter = filter_params
    @sort = params[:sort]
    @people = Person.filter(name: @filter[:name],
        email: @filter[:email],
        phone: @filter[:phone],
        address: @filter[:address])
      .order(Person.sortString(@sort))
  end

  private
    def filter_params
      params.permit(:name, :phone, :email, :address)
    end
end
