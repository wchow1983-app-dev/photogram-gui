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

  def add

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
  
    # Create new records using "Photo.new"
    # Refer to the Schema Information to assign the attribute accessors. For example: "a_new_photo.image = input_image"
    # Save the record using ".save" to transact the new record: "a_new_photo.save"
    # We can redirect it to the new photo posting using the photo ID just created from "Photo.new". The unique photo ID 
    # will automatically generate so we can use it, and include it in the URL in the redirect_to. Remember to convert 
    # to String because the photo ID is an integer. 

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

    #render({:template => "photo_templates/add.html.erb"})
  end

end