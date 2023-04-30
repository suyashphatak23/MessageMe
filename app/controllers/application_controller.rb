class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resource)
    # Replace this with the path you want to redirect to
    root_path
  end
end
