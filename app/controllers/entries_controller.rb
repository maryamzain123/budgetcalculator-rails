class EntriesController < ApplicationController

  before_action :find_entry, only: [:index, :show, :edit, :update, :destroy]
  before_action :find_category, only: [:index, :show, :edit, :update, :destroy]
  before_action :find_user, only: [:index, :show, :edit, :update, :destroy]


    def index

        if params[:search_term].blank?
          @user = current_user
          @category = Category.find_by_id(params[:category_id])

          @entries = current_user.entries.most_recent
       
        else
          @entries = Entry.search(params[:search_term]).filter{|entry| entry.user_id == current_user.id}
        end
     
    end

      def show
        @category = Category.find_by_id(params[:category_id])
        @user = current_user
        
      end
    
      def new
        if params[:category_id]
          @category = Category.find_by_id(params[:category_id])
          @user = current_user

        @entry = @category.entries.build
        else
          redirect_to "/"
        end
      end
    
      def create
        
        if params[:category_id]
        @category = Category.find_by_id(params[:category_id])
        @entry =  @category.entries.build(entry_params)
        @entry.user_id = current_user.id
        @entry.save
        redirect_to category_entry_path(@category, @entry)
      end
    end

      def purchase
        @user_purchase =  current_user.entries.expensive_purchase

      end
      
    

    def edit
      
      @user = current_user
    end

    def update
        @entry.update(entry_params)
        redirect_to category_entry_path(@category, @entry)
    end

    def destroy
        @entry.destroy
        redirect_to category_path(@category)
    end

  
    private

    def find_category
      @category = Category.find_by_id(params[:category_id])  
    end

    def find_user
      @user = User.find_by_id(params[:user_id])  
    end


    def find_entry
      @entry = Entry.find_by_id(params[:id])
    end

    def entry_params
        params.require(:entry).permit( :details, :amount, :month,  :category_id)
    end
  
  
end