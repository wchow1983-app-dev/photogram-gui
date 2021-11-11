class PhotosController < ApplicationController

  def index

    all_photos = Photo.all
    @list_of_photos = all_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

# we did not need to use "all_photos = Photo.all" to access the Photo databse because we are already accessing it
# by using "Photo.where" which is the same thing. 

  def show

    the_photo = params.fetch("photo_id")
    @user_photos = Photo.where({ :id => the_photo }).first

    render({:template => "photo_templates/show.html.erb"})
  end

# we did not make the "user_photos" and instance variable (ie "@user_photos") because we want it to enat at the
# end of this method unit it renders to the views photo template.

  def delete

    the_photo = params.fetch("photo_id")

    user_photos = Photo.where({ :id => the_photo }).first

    user_photos.destroy

    redirect_to("/photos")

    #render({:template => "photo_templates/delete.html.erb"})
  end
end