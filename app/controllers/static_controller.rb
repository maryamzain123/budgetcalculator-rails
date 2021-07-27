class StaticController < ApplicationController
    def home
        @category = Category.find_by_id(params[:category_id])
@user = current_user
    end
end