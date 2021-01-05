class GuestSessionsController < ApplicationController
    

  def create
    user = User.find_by(email: 'guest@example.com')
    log_in(user)
    #sessions_helperに定義している↑
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = '閲覧ありがとうございます'
    redirect_to user
  end
    
end
