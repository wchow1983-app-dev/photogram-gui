Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })

  get("/users", { :controller => "user", :action => "index" })
  
  get("/users/:username", { :controller => "user", :action => "show" })

end
