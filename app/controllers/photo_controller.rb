class PhotoController < ApplicationController

  def index

    all_photos = Photo.all
    @list_of_photos = all_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show

    all_photos = Photo.all
    the_photo = params.fetch("photo_id")
    @user_photos = Photo.where({ :id => the_photo }).first

    render({:template => "photo_templates/show.html.erb"})
  end
end