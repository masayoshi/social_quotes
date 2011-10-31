SocialQuotes::Application.routes.draw do
  devise_for :users

  resources :quotes
  root :to => "quotes#index"
end
#== Route Map
# Generated on 30 Oct 2011 17:09
#
#             user_session POST   /users/sign_in(.:format)          {:action=>"create", :controller=>"devise/sessions"}
#     destroy_user_session DELETE /users/sign_out(.:format)         {:action=>"destroy", :controller=>"devise/sessions"}
#            user_password POST   /users/password(.:format)         {:action=>"create", :controller=>"devise/passwords"}
#        new_user_password GET    /users/password/new(.:format)     {:action=>"new", :controller=>"devise/passwords"}
#       edit_user_password GET    /users/password/edit(.:format)    {:action=>"edit", :controller=>"devise/passwords"}
#                          PUT    /users/password(.:format)         {:action=>"update", :controller=>"devise/passwords"}
# cancel_user_registration GET    /users/cancel(.:format)           {:action=>"cancel", :controller=>"devise/registrations"}
#        user_registration POST   /users(.:format)                  {:action=>"create", :controller=>"devise/registrations"}
#    new_user_registration GET    /users/sign_up(.:format)          {:action=>"new", :controller=>"devise/registrations"}
#   edit_user_registration GET    /users/edit(.:format)             {:action=>"edit", :controller=>"devise/registrations"}
#                          PUT    /users(.:format)                  {:action=>"update", :controller=>"devise/registrations"}
#                          DELETE /users(.:format)                  {:action=>"destroy", :controller=>"devise/registrations"}
#        user_confirmation POST   /users/confirmation(.:format)     {:action=>"create", :controller=>"devise/confirmations"}
#    new_user_confirmation GET    /users/confirmation/new(.:format) {:action=>"new", :controller=>"devise/confirmations"}
#                          GET    /users/confirmation(.:format)     {:action=>"show", :controller=>"devise/confirmations"}
#                   quotes GET    /quotes(.:format)                 {:action=>"index", :controller=>"quotes"}
#                          POST   /quotes(.:format)                 {:action=>"create", :controller=>"quotes"}
#                new_quote GET    /quotes/new(.:format)             {:action=>"new", :controller=>"quotes"}
#               edit_quote GET    /quotes/:id/edit(.:format)        {:action=>"edit", :controller=>"quotes"}
#                    quote GET    /quotes/:id(.:format)             {:action=>"show", :controller=>"quotes"}
#                          PUT    /quotes/:id(.:format)             {:action=>"update", :controller=>"quotes"}
#                          DELETE /quotes/:id(.:format)             {:action=>"destroy", :controller=>"quotes"}
#                     root        /                                 {:controller=>"quotes", :action=>"index"}
