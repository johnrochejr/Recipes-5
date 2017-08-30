class IngredientsController < ApplicationController
  # GET /ingredients
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients
  end

  # GET /ingredients/1
  def show
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
  end

  # GET /ingredients/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
  end

  # GET /ingredients/1/edit
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  # POST /ingredients
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient, notice: 'Sauce it in!'
    else
      render :new
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredients/1
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def ingredient_params
    params.require(:ingredient).permit(:item)
  end
end
