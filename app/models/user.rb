class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:name,:username,:facilitator_group_id,:admin,:facilitator

  belongs_to :facilitator_group
   has_many :student_group_users, :dependent => :destroy
   has_many :student_groups,:through => :student_group_users



end
