class ContactsController < ApplicationController

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def index
    @search_result = params[:search_result]
    @group_result = params[:group]
    if current_user
      if @search_result
        @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", @search_result, @search_result)
      elsif @group_result
        selected_group = Group.find_by(category: @group_result)
        @contacts = selected_group.contacts.where(user_id: current_user.id)
      else
        @contacts = current_user.contacts
      end
      render "index.html.erb"
    else
      puts "Please login to view your contacts."
      redirect_to "/login"
    end
  end

  def new
    @contact = Contact.new
    render "new.html.erb"
  end

  def create
    address = params[:address]
    coordinates = Geocoder.coordinates(address)
    if coordinates
      latitude = coordinates[0]
      longitude = coordinates[1]
    else
      latitude = nil
      longitude = nil
    end
    @contact = Contact.new(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: latitude, longitude: longitude, user_id: current_user.id)
    if @contact.save
      render "create.html.erb"
    else
      render "new.html.erb"
    end
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