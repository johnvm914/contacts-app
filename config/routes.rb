Rails.application.routes.draw do
  get "/first_contact", to: "contacts#first_contact_method"
  get "/all_contacts", to: "contacts#all_contacts_method"
end

