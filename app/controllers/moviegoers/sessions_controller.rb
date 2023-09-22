# frozen_string_literal: true

class Moviegoers::SessionsController < Devise::SessionsController

  def after_sign_out_path_for(_resource_or_scope)
    new_moviegoer_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end
  
end
