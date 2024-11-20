class ApplicationController < ActionController::Base
     #override after_sign_in_path_for method that is called by Devise
   def after_sign_in_path_for(resource)
    # Redirect to the student's profile using devise method current_student
    owner_path(current_owner) # Redirect to the logged-in student's profile
   end

end
