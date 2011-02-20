module TalksHelper

  def zapisany?
    !(@talk.users.all.detect { |user| user == current_user }.nil?)
   end
   
   
end
