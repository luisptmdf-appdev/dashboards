Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", {:controller => "application", :action => "index"})
  get("/forex/:first_currency/:second_currency", {:controller => "forex", :action => "conversion_result"})
  get("/forex/:first_currency", {:controller => "forex", :action => "second_currency"})
  get("/forex", {:controller => "forex", :action => "index"})
  get("/covid", {:controller => "application", :action => "index"})
  
end
