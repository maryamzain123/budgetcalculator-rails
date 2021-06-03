class EntriesController < ApplicationController

  before_action :find_entry, only: [:index, :show, :edit, :update, :destroy]
  before_action :find_user, only: [:index, :show, :edit, :update, :destroy]


    def index
      if params[:user_id]  
        # find_user
        @entries = @user.entries 
        @categories = Category.all
      else
        redirect_to entries_path
       end
    end

      def show
        if params[:user_id] 
        else
          redirect_to login_path
        end
      end
    
      def new
        @signedin_user = current_user
        @entry = @signedin_user.entries.build
      end
    
      def create
        @signedin_user = current_user
        @entry =  @signedin_user.entries.build(entry_params)
        @entry.save
        redirect_to user_entry_path(@user, @entry)
      end
    

    def edit
    end

    def update
        @entry.update(entry_params)
        redirect_to user_entry_path(@user, @entry)
    end

    def destroy
      if params[:user_id] 
        # find_user
        @entry.destroy
        redirect_to user_entries_path(@user)
      end
    end

  
    private

    def find_user
        # @user = User.find_by_id(params[:user_id])
        @signedin_user = current_user
    end


    def find_entry
      @entry = Entry.find_by_id(params[:id])
    end
    def entry_params
        params.require(:entry).permit( :details, :amount, :month, :user_id, :category_id)
    end
  
  
end