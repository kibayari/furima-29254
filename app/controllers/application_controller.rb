class ApplicationController < ActionController::Base
  # データーベースへのカラム内容の保存許可
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :password, :last_name, :first_name_kana, :last_name_kana, :email, :birth_date])
  end
end