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

    all_users = Photo.all

    render({ :template => "user_templates/show.html.erb"})
  end
end

