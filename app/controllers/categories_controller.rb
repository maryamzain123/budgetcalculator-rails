class CategoriesController < ApplicationController
    def index
        if (params[:user_id]).to_i == current_user.id
        @categories = current_user.categories.uniq
    else
        session.clear
        redirect_to login_path
       end
    end
    
    def show
        
        @category = Category.find_by(params[:id])
        @entries = @category.entries.filter { |ent| ent.user ==  current_user}
      binding.pry
       

    end
    

end