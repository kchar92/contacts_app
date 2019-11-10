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

end
