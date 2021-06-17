class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?
#sessionのuser_idからユーザ情報の取得
  def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end
#ユーザー情報が取得できているか確認
  def logged_in?
    !current_user.nil?
  end
end
