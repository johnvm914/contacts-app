class ContactsController < ApplicationController

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    address = params[:address]
    coordinates = Geocoder.coordinates(address)
    latitude = coordinates[0]
    longitude = coordinates[1]
    @contact = Contact.new(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: latitude, longitude: longitude)
    @contact.save
    render "create.html.erb"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    address = params[:address]
    coordinates = Geocoder.coordinates(address)
    latitude = coordinates[0]
    longitude = coordinates[1]
    @contact = Contact.find_by(id: params[:id])
    @contact.assign_attributes(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: latitude, longitude: longitude)
    @contact.save
    render "update.html.erb"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render "destroy.html.erb"
  end

end