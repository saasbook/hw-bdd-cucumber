# frozen_string_literal: true

class Moviegoers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = Moviegoer.from_omniauth(auth)
    if user.present?
      sign_out_all_scopes
      flash[:success] =
        t 'devise.omniauth_callbacks.success',
        kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] =
        t 'devise.omniauth_callbacks.failure',
        kind: 'Google',
        reason: "#{auth.info.email} is not authorized."
      redirect_to new_moviegoer_session_path
    end
  end
    
  private
  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
