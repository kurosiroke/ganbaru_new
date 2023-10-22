class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
     #devise gemインストール後使用できるconfigure_permitted_parametersメソッド
     
    def after_sign_in_path_for(resource) #サインイン・サインアップ後の遷移する
      case resource
      when Admin
        admin_attempts_path
      when User
        root_path
      end
    end
    
      protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])#セットアップ時名前の操作
    end
end
