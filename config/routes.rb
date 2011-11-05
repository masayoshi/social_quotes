SocialQuotes::Application.routes.draw do
  devise_for :users, :controllers => { :registrations =>'registrations' }  
  resources :quotes
  root :to => "quotes#index"

  match '/auth/:provider/callback' => 'services#create'
  resources :services, :only => [:index, :create, :destroy]
end
#== Route Map
# Generated on 04 Nov 2011 23:56
#
#             user_session POST   /users/sign_in(.:format)           {:action=>"create", :controller=>"devise/sessions"}
#     destroy_user_session DELETE /users/sign_out(.:format)          {:action=>"destroy", :controller=>"devise/sessions"}
#            user_password POST   /users/password(.:format)          {:action=>"create", :controller=>"devise/passwords"}
#        new_user_password GET    /users/password/new(.:format)      {:action=>"new", :controller=>"devise/passwords"}
#       edit_user_password GET    /users/password/edit(.:format)     {:action=>"edit", :controller=>"devise/passwords"}
#                          PUT    /users/password(.:format)          {:action=>"update", :controller=>"devise/passwords"}
# cancel_user_registration GET    /users/cancel(.:format)            {:action=>"cancel", :controller=>"registrations"}
#        user_registration POST   /users(.:format)                   {:action=>"create", :controller=>"registrations"}
#    new_user_registration GET    /users/sign_up(.:format)           {:action=>"new", :controller=>"registrations"}
#   edit_user_registration GET    /users/edit(.:format)              {:action=>"edit", :controller=>"registrations"}
#                          PUT    /users(.:format)                   {:action=>"update", :controller=>"registrations"}
#                          DELETE /users(.:format)                   {:action=>"destroy", :controller=>"registrations"}
#        user_confirmation POST   /users/confirmation(.:format)      {:action=>"create", :controller=>"devise/confirmations"}
#    new_user_confirmation GET    /users/confirmation/new(.:format)  {:action=>"new", :controller=>"devise/confirmations"}
#                          GET    /users/confirmation(.:format)      {:action=>"show", :controller=>"devise/confirmations"}
#                   quotes GET    /quotes(.:format)                  {:action=>"index", :controller=>"quotes"}
#                          POST   /quotes(.:format)                  {:action=>"create", :controller=>"quotes"}
#                new_quote GET    /quotes/new(.:format)              {:action=>"new", :controller=>"quotes"}
#               edit_quote GET    /quotes/:id/edit(.:format)         {:action=>"edit", :controller=>"quotes"}
#                    quote GET    /quotes/:id(.:format)              {:action=>"show", :controller=>"quotes"}
#                          PUT    /quotes/:id(.:format)              {:action=>"update", :controller=>"quotes"}
#                          DELETE /quotes/:id(.:format)              {:action=>"destroy", :controller=>"quotes"}
#                     root        /                                  {:controller=>"quotes", :action=>"index"}
#                                 /auth/:provider/callback(.:format) {:controller=>"services", :action=>"create"}
#                 services GET    /services(.:format)                {:action=>"index", :controller=>"services"}
#                          POST   /services(.:format)                {:action=>"create", :controller=>"services"}
#                  service DELETE /services/:id(.:format)            {:action=>"destroy", :controller=>"services"}
