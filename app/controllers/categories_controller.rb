class CategoriesController < ApplicationController
    
    
    def index
       
        if (params[:user_id]).to_i == current_user.id
        @categories = current_user.categories.uniq
    else
        session.clear
        redirect_to login_path
       end
    end
    

    def new
    end
    
    def show
        
            @signedin_user = current_user
            @category = Category.find_by_id(params[:id])
            @entries = @signedin_user.entries.filter { |entry| entry.category_id == @category.id}  
    end
    
   

end