class ApplicationController < ActionController::Base
   before_action :basic_auth
   before_action :configuer_permitted_parameters, if: :devise_controller?

   private
   def configuer_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_date, :family_name, :name, :family_name_kana, :name_kana, :nickname, :email])
   end

   def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'Ussii' && password =='XXX-01H'
      end
    end
end
