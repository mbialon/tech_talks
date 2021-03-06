class User < ActiveRecord::Base
	
	has_many :attendances
	
	has_many :talks, :through => :attendances
	

	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  ajaxful_rater
 
  def to_s
    email
  end
end
