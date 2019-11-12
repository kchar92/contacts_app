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
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email]
    )
    @contact.save
    render 'contact_index.json.jb'
  end

  def update

    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.email = params[:email] || @contact.email

    @contact.save

    render 'contact_index.json.jb'
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy

    render 'contact_destroy.json.jb'
  end

end
