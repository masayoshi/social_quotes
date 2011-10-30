SocialQuotes::Application.routes.draw do
  resources :quotes
  root :to => "quotes#index"
end
#== Route Map
# Generated on 30 Oct 2011 10:55
#
#            POST   /quotes(.:format)          {:action=>"create", :controller=>"quotes"}
#  new_quote GET    /quotes/new(.:format)      {:action=>"new", :controller=>"quotes"}
# edit_quote GET    /quotes/:id/edit(.:format) {:action=>"edit", :controller=>"quotes"}
#      quote GET    /quotes/:id(.:format)      {:action=>"show", :controller=>"quotes"}
#            PUT    /quotes/:id(.:format)      {:action=>"update", :controller=>"quotes"}
#            DELETE /quotes/:id(.:format)      {:action=>"destroy", :controller=>"quotes"}
#       root        /                          {:controller=>"quotes", :action=>"index"}
