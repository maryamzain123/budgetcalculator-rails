class CategoriesController < ApplicationController

    
    
    def show
        if params[:user_id]
            @signedin_user = current_user
            @category = Category.find_by_id(params[:id])
            @entries = @signedin_user.entries.filter { |entry| entry.category_id == @category.id}   
 
        else
            redirect_to login_path
        end
    end
    

end
