class UsersController < ApplicationController

  def index

    all_users = User.all
    @list_of_users = all_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  # we did not need to use "all_users = User.all" to access the Photo databse because we are already accessing it
  # by using "User.where" which is the same thing. 

  def show

    the_username = params.fetch("username")
    @the_user = User.where({:username => the_username}).first

  #all_photos = Photo.all 

  # "all_photos = Photo.all" is not necessary because in the show.html.erb template, we are only referencing the 
  # photo database for the "Own photos" section which utilized the User class and all the instance methods in its 
  # respective User "/app/models". This includes "own_photos" which accesses the Photo database (i.e. Photo.where).

    render({ :template => "user_templates/show.html.erb"})
  end


  def add

    the_username = params.fetch("username")

    new_username = User.new

    new_username.username = the_username

    new_username.save

    redirect_to("/users/" + new_username.username)
  end
 
  def update

    the_username = params.fetch("username")
    the_user = User.where({:username => the_username}).first

    updated_username = params.fetch("input_username")

    the_user.username = updated_username

    the_user.save

    redirect_to("/users/" + the_user.username)
  end
end

