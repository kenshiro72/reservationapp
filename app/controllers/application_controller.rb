class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end

private
def after_sign_in_path_for(resource)
  home_top_path # ログイン後に遷移するpathを設定
end

def after_sign_out_path_for(resource)
  home_top_path # ログアウト後に遷移するpathを設定
end
