class ApplicationController < ActionController::Base

  def homepage

    all_users = User.all
    @list_of_users = all_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end
end
