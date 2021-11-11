Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })

  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:photo_id", { :controller => "photos", :action => "show" })

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })

  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete" })

  get("/insert_photo", { :controller => "photos", :action => "add" })
end
