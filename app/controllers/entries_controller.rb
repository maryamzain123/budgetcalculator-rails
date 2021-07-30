
  class EntriesController < ApplicationController

    before_action :find_entry, only: [:index, :show, :edit, :update, :destroy]
    before_action :find_user, only: [:index, :show, :edit, :update, :destroy]
    before_action :find_category, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  
  
      def index
          if params[:search_term].blank?
            @entries = @category.entries.where(:user_id => current_user.id ).most_recent
          else
            @entries = Entry.search(params[:search_term]).filter{|entry| entry.user_id == @user.id}
          end
      end
  
      
  
        def show
          if (params[:category_id])
            @entry = @category.entries.where(:user_id => current_user.id, :id => params[:id]).last
          else
            redirect_to "/"
        end 
        end
    
      
        def new
          if (params[:category_id])
          @user = current_user
          @entry = @category.entries.build
          else
          redirect_to "/"
          end
        end
      
        def create
          @entry =  @category.entries.build(entry_params)
          if @entry.save
          redirect_to category_entry_path(@category, @entry)
          else 
            redirect_to new_category_entry_path(@category, @entry)
          end
        end
      
  
      def edit
        @category = Category.find(params[:category_id])

      end
  
      def update
          @category = Category.find(params[:category_id])
          @entry.update(entry_params)
          redirect_to category_entries_path(@category)
      end
  
      def destroy
          @category = Category.find(params[:category_id])
          @entry.destroy
          redirect_to category_entries_path(@category)
      end
  
    
      private
  
      def find_user
        @user = User.find_by_id(params[:user_id])
          
      end
      
      def find_entry
        @entry = Entry.find_by_id(params[:id])
      end

      def find_category
      @category = Category.find(params[:category_id])
      end

      def entry_params
          params.require(:entry).permit( :details, :amount, :month, :user_id, :category_id)
      end
    
    
  end