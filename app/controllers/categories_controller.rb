class CategoriesController < ApplicationController
    
    
    def index
        @categories = current_user.categories.uniq
    end
    
    def show
            @category = Category.find_by_id(params[:id])
            @entries = @category.entries.where(:user_id => current_user.id)
    end
    

end