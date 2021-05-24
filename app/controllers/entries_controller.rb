class EntriesController < ApplicationController

  before_action :find_entry, only: [:show, :edit, :update, :destroy]

    def index
      if params[:user_id]  
        find_user
        @entries = @user.entries 
        @categories = Category.all
      else
        redirect_to entries_path
       end
    end
      
      def month
        if params[:user_id]  
        
          find_user
                if Entry.month_entries("January").size == 0 
            puts "no entries"
                  binding.pry
                else
               @monthentries = Entry.month_entries("January").filter { |entry| entry.user_id == @user.id}  

                binding.pry
                end  
        else
          redirect_to login_path
         end
        
      end


    
      def show
        if params[:user_id] 
          find_user
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
        redirect_to entry_path(@entry)
      end
    

    def edit

    end

    def update
        @entry.update(entry_params)
        redirect_to entry_path(@entry)
    end

    def destroy
        @entry.destroy
        # redirect_to entries_path
        end

     


    private

    def find_user
        @user = User.find_by_id(params[:user_id])
    end


    def find_entry
      @entry = Entry.find_by_id(params[:id])
  end
    def entry_params
        params.require(:entry).permit( :details, :amount, :month, :user_id, :category_id)
    end
  
  
end