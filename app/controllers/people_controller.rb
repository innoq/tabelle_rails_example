class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @people = Person.filter(name: filter_params[:name],
      email: filter_params[:email],
      phone: filter_params[:phone],
      address: filter_params[:address])
  end

  private
    def filter_params
      params.permit(:name, :phone, :email, :address)
    end
end
