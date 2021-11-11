class UserController < ApplicationController

  def index

    all_users = User.all
    @list_of_users = all_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def show

    all_users = User.all
    the_username = params.fetch("username")
    @the_user = User.where({:username => the_username}).first

    #all_photos = Photo.all 

    #"all_photos = Photo.all" is not necessary because in the show.html.erb template, we are only 
    #referencing the photo database for the "Own photos" section which utilized the User class and 
    #all the instance methods in its respective User "/app/models". This includes "own_photos" 
    #which accesses the Photo database (i.e. Photo.where).  

    render({ :template => "user_templates/show.html.erb"})
  end
end

