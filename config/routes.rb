Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })

  get("/users", { :controller => "users", :action => "index" })

  get("/add_username", { :controller => "users", :action => "add" })

  get("/users/:username", { :controller => "users", :action => "show" })

  get("/update_user/:username", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:photo_id", { :controller => "photos", :action => "show" })

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })

  get("/add_photos/:photo_id", { :controller => "photos", :action => "comment" })

  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete" })

  get("/insert_photo", { :controller => "photos", :action => "add" })
end
