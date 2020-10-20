class ShoppingItemsController < ApplicationController
    def index 
        shopping_item = ShoppingItem.all
           
        render json: shopping_item, only: [:id, :recipe, :name, :user_id]
    end
    
    def create 
        shopping_item = ShoppingItem.create!(recipe:params[:recipe], name:params[:name], user_id:params[:user_id])
        all_shopping_items = User.find(params[:user_id]).shopping_items    
        render json: all_shopping_items, only: [:recipe, :name, :user_id]
          
    end
    
    def destroy
        @shopping_item = ShoppingItem.find(params[:id])
        @user_shopping_item = @shopping_item.user
        @shopping_item.destroy
        all_shopping_items = @user_shopping_item.shopping_items
        render json: all_shopping_items, only: [:recipe, :name, :user_id]
    end
    
    
    end