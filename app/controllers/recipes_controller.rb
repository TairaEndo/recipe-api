class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    recipes = Recipe.all
    render json: {recipes: recipes}
  end

  # GET /recipes/1 or /recipes/1.json
  def show
        render json: {
          'message': "Recipe details by id",
          'recipe': @recipe,
        }
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    recipe = Recipe.new(recipe_params)

    if recipe.save
      # format.html { redirect_to recipe_url(@recipe), notice: "Recipe successfully created." }
      # format.json { render :show, status: :created, location: @recipe }
      render json: { status: 'SUCCESS', message: 'Recipe Successfully created!', recipe: recipe}
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
    
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:id, :title, :making_time, :serves, :ingredients, :cost, :created_at, :updated_at)
    end
end
