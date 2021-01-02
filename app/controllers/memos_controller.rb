class MemosController < ApplicationController
    before_action :correct_user, only: [:show, :destroy]
    
    def show
        @memo = Memo.find(params[:id])
    end
    
    def new
        @memo = Memo.new
    end
    
    def create
        @memo = current_user.memos.build(memo_params)
        if @memo.save
            flash[:success] = "新規メモを作成しました"
            redirect_to @memo
        else
            render 'new'
        end
    end
    
    def destroy
        @memo.destroy
         flash[:success] = "メモを削除しました"
        redirect_to request.referrer || root_url
    end
    
    
    private
    
    
        def memo_params
            params.require(:memo).permit(:title, :weight, :times, :set, :memo )
        end
    
        def correct_user
            @memo = current_user.memos.find_by(id: params[:id])
            redirect_to root_url if @memo.nil?
        end
            
            
    
end
