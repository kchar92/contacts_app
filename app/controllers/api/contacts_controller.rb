class Api::ContactsController < ApplicationController
  def first_contact
    @contact = Contact.first
    render 'contacts.json.jb'
  end
end
