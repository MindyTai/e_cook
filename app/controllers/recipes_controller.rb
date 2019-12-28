class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_recipe, only: [ :edit, :update, :destroy]
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new()
  end

  def show
    # find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def edit
    # find_recipe
    # @recipe= Recipe.find_by(user_id: current_user.id, id: params[:id])
    
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
    # @recipe = Recipe.new(clean_params)
    # @recipe.user_id = current_user.id

    @recipe = current_user.recipes.new(clean_params)
    if @recipe.save #write to database
      flash["notice"] = '新增成功'
      redirect_to "/"
    else
      render :new # app/views/recipes/new.html #will retain previous data
    end
  end

  def my
    @recipes = current_user.recipes
    render :index
  end

  private
    def clean_params
      params.require(:recipe).permit(:title, :description, :photo)
    end

    def find_recipe
      @recipe = current_user.recipes.find(params[:id])
    end
end
