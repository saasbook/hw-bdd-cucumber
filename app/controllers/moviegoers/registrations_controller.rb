# frozen_string_literal: true

class Moviegoers::RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'
      params.delete('current_password')
      resource.password = params['password']
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end
end
