class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
    render json: {
      recipes: @recipes
    }
  end

  # GET /recipes/1 or /recipes/1.json
  def show
        render json: {
          'message': "Recipe details by id",
          'recipe': [@recipe]
        }
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: {
        status: 'SUCCESS',
        message: 'Recipe Successfully created!',
        recipe: [@recipe]
      }, status: :ok
    else
      render json: {
        message: "Recipe creation failed!",
        required: "title, making_time, serves, ingredients, cost"
        }, status: :ok
    end
    
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      render json: { message: "Recipe Successfully updated!", recipe: [@recipe] }
    else
      render json: { message: "Recipe update failed!", required: "title, making_time, serves, ingredients, cost" }, status: :not_found
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    render json: { message: "Recipe was successfully removed!" }
  rescue ActiveRecord::RecordNotFound
    render json: { message: "No Recipe found" }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { message: "No Recipe found" }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :making_time, :serves, :ingredients, :cost)
    end
end
