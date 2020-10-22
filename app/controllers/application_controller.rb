class ApplicationController < ActionController::Base
   before_action :basic_auth
   before_action :configure_permitted_parameter, if: :devise_controller?

   private
   def configuer_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up,key: [:nickname])
   end

   def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == '' && password ==''
      end
    end
end
