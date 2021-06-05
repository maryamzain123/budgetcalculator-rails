class CategoriesController < ApplicationController

    
    
    def show
        if (params[:user_id]).to_i == current_user.id
            @user = User.find_by_id(params[:user_id])
            @category = Category.find_by_id(params[:id])
            @entries = @user.entries.filter { |entry| entry.category_id == @category.id}   
 
        else
            redirect_to user_entries_path(@user)
        end
    end
    

end
