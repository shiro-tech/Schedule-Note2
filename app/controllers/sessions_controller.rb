class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_params)
    # binding pry
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

#ログアウトの実行
  def destroy
    log_out
    redirect_to root_url, info:'ログアウトしました'
  end
#paramsセキュリティ設定
  private
    def email_params
      params.require(:session).permit(:email)
    end
    def password_params
      params.require(:session).permit(:password)
    end

  #ログイン時のID紐付け
    def log_in(user)
      session[:user_id] = user.id
    end

  #ログアウト時の処理
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end

end
