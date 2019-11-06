class Api::ContactsController < ApplicationController
  def first_contact
    @contact = Contact.first
    render 'contacts.json.jb'
  end

  def all
    @contacts = Contact.all
    render 'every_contact.json.jb'
  end
end
