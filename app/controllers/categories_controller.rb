class CategoriesController < ApplicationController
    
    
    def index
        @categories = current_user.categories.uniq
    end
    

    def new
    end
    
    def show
        
            @signedin_user = current_user
            @category = Category.find_by_id(params[:id])
            @entries = @signedin_user.entries.filter { |entry| entry.category_id == @category.id}  
    end
    
   

end