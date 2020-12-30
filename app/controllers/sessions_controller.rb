class SessionsController < ApplicationController
  def new
  end
  
  def create
     user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
      #↑sessions_helperで定義。アクセス元のオリジナルのURLにリダイレクトする、もしくは「user」つまり、プロフページにリダイレクトするというメソッド。
    else
      flash.now[:danger] = 'I不正なメールアドレスまたはパスワードです'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
