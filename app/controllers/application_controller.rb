class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :singular_class_name
  
end
