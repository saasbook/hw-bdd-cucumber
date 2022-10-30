# frozen_string_literal: true

class Moviegoers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  
  #def destroy
  #super
   # @authen = current_moviegoer.authenticatable_salt.find(params[:id])
    #@authen.destroy

  #end
  
  def after_sign_out_path_for(_resource_or_scope)
  
    movies_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || movies_path
  end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
