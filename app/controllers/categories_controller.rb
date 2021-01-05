class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "カテゴリを作成しました"
      redirect_to categories_path
    else
      @categories = Category.all
      render 'index'
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "カテゴリを編集しました"
      redirect_to categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    flash[:success] = "カテゴリーを削除しました"
    redirect_to categories_path
  end
  
  
  private
  
    def category_params
      params.require(:category).permit(:name)
    end
end
