Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # url             # controller name   # method name
    get "/first_contact" => "contacts#first_contact"
    get "/all_contacts" => "contacts#all"
  end
end
