class CategoriesController < ApplicationController

    def index
        if (params[:user_id]).to_i == current_user.id
        @categories = Category.category_sort
    else
        session.clear
        redirect_to login_path
       end
    end
    
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
