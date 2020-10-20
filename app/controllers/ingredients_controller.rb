class IngredientsController < ApplicationController
def index 
    ingredient = Ingredient.all
       
    render json: ingredient, only: [:id, :name, :user_id]
end

def create 
    ingredient = Ingredient.create!(name:params[:name], user_id:params[:user_id])
    all_ingredients = User.find(params[:user_id]).ingredients    
    render json: all_ingredients, only: [:id, :name, :user_id]
      
end
def destroy
    @ingredient = Ingredient.find(params[:id])
    @user_ingredient = @ingredient.user
    @ingredient.destroy
    all_ingredients = @user_ingredient.ingredients
    render json: all_ingredients, only: [:name, :user_id]
end


end