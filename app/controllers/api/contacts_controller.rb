class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    render 'contacts_index.json.jb'
  end
  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)

    render 'contact_index.json.jb'
  end
  def create
    # address = params[:address]
    # coordinates = Geocoder.coordinates(address)
    
    # latitude = coordinates[0]
    # longitude = coordinates[1]

    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      bio: params[:bio],
      # latitude: latitude,
      # longitude: longitude
    )
    if @contact.save
      render 'contact_index.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.email = params[:email] || @contact.email
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'contact_index.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render 'contact_destroy.json.jb'
  end

end
