class UserRecipesController < ApplicationController
  def index 
    user_recipe = UserRecipe.all

    render json: user_recipe, only: [:id, :title, :ingredients, :readyInMinutes, :sourceUrl, :image, :user_id]
end

def create 
    user_recipe = UserRecipe.create!(title:params[:title], ingredients:params[:ingredients], readyInMinutes:params[:readyInMinutes], sourceUrl:params[:sourceUrl], image:params[:image], user_id:params[:user_id])
    all_recipes = User.find(params[:user_id]).user_recipes        
    render json: all_recipes, only: [:title, :ingredients, :readyInMinutes, :sourceUrl, :image, :user_id]
end
def destroy
  
  @user_recipe = UserRecipe.find(params[:id])
  @user_recipe_user = @user_recipe.user
  @user_recipe.destroy
  all_recipes = @user_recipe_user.user_recipes
  render json: all_recipes, only: [:name, :user_id]
end

end