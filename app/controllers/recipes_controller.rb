class RecipesController < ApplicationController

  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new()
  end

  def show
    # find_recipe
  end

  def edit
    # find_recipe
  end

  def update
    # find_recipe
    if @recipe.update(clean_params)
      flash["notice"] = '已更新'
      redirect_to root_path
    else
      render :edit
    end
  end

  def other
  end

  def destroy
    @recipe.destroy
    # flash["notice"] = '已刪除'
    redirect_to root_path, notice: '已刪除'
    # find_recipe
  end

  def create
    #strong parameters
    @recipe = Recipe.new(clean_params)
    if @recipe.save #write to database
      flash["notice"] = '新增成功'
      redirect_to "/"
    else
      render :new # app/views/recipes/new.html #will retain previous data
    end
  end

  private
    def clean_params
      params.require(:recipe).permit(:title, :description)
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end
