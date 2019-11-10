class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all

    render 'contacts_index.json.jb'
  end

end
