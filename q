
[1mFrom:[0m /home/maryamzain/development/code/mod3/budgetcalculator-rails/app/controllers/entries_controller.rb:8 EntriesController#index:

     [1;34m4[0m: [32mdef[0m [1;34mindex[0m
     [1;34m5[0m:   [32mif[0m params[[33m:user_id[0m]  
     [1;34m6[0m:     
     [1;34m7[0m:     find_user
 =>  [1;34m8[0m:     binding.pry
     [1;34m9[0m: 
    [1;34m10[0m:     @entries = @user.entries   
    [1;34m11[0m:   
    [1;34m12[0m:   [32melse[0m
    [1;34m13[0m:     @entries = [1;34;4mEntry[0m.all 
    [1;34m14[0m:    [32mend[0m
    [1;34m15[0m:   [32mend[0m

