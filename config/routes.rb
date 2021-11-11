Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })

  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:photo_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:photo_id", { :controller => "photos", :action => "show" })
end
